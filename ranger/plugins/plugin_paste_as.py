from __future__ import (absolute_import, division, print_function)

from ranger.core.loader import Loadable
from ranger.core.shared import FileManagerAware
from ranger.api.commands import Command

from collections import deque
from subprocess import Popen, PIPE
from time import time, sleep
import math
import os.path
import select
import sys
import errno

import subprocess

from ranger.ext.human_readable import human_readable

import ranger.api

PASTE_AS_APPEND_KEY = 'pa'

HOOK_INIT_OLD = ranger.api.hook_init

class CopyPasteLoader(Loadable, FileManagerAware):  # pylint: disable=too-many-instance-attributes
    progressbar_supported = True

    def __init__(self, copy_buffer, new_name, do_cut=False):
	self.copy_buffer = tuple(copy_buffer)
	self.do_cut = do_cut
	self.overwrite = False
	self.original_copy_buffer = copy_buffer
	self.original_path = os.path.join(self.fm.thistab.path, new_name)
	self.percent = 0
	if self.copy_buffer:
	    self.one_file = self.copy_buffer[0]
	Loadable.__init__(self, self.generate(), 'Calculating size...')

    def _calculate_size(self, step):
	from os.path import join
	size = 0
	stack = [fobj.path for fobj in self.copy_buffer]
	while stack:
	    fname = stack.pop()
	    if os.path.islink(fname):
		continue
	    if os.path.isdir(fname):
		stack.extend([join(fname, item) for item in os.listdir(fname)])
	    else:
		try:
		    fstat = os.stat(fname)
		except OSError:
		    continue
		size += max(step, math.ceil(fstat.st_size / step) * step)
	return size

    def generate(self):
	if not self.copy_buffer or len(self.copy_buffer) > 1:
	    return

	from ranger.ext import shutil_generatorized as shutil_g
	# TODO: Don't calculate size when renaming (needs detection)
	bytes_per_tick = shutil_g.BLOCK_SIZE
	size = max(1, self._calculate_size(bytes_per_tick))
	size_str = " (" + human_readable(self._calculate_size(1)) + ")"
	done = 0

	self.description = "copying: " + self.one_file.path + size_str

	fobj = self.copy_buffer[0]
	if os.path.isdir(fobj.path) and not os.path.islink(fobj.path):
	    n = 0
	    for n in shutil_g.copytree(
		    src=fobj.path,
		    dst=os.path.join(self.original_path, fobj.basename),
		    symlinks=True,
		    overwrite=self.overwrite,
	    ):
		self.percent = ((done + n) / size) * 100.
		yield
	    done += n
	else:
	    n = 0
	    for n in shutil_g.copy2(fobj.path, self.original_path,
				    symlinks=True, overwrite=self.overwrite):
		self.percent = ((done + n) / size) * 100.
		yield
	    done += n

	cwd = self.fm.get_directory(self.original_path)
	cwd.load_content()

class paste_as(Command):
    """:paste_as <newname>

    Paste file with a new name
    """
    def execute(self):
	from ranger.container.file import File
	from os import access

	new_name = self.rest(1)

	if not new_name:
	    return self.fm.notify('Syntax: paste_as <newname>', bad=True)

	if access(new_name, os.F_OK):
	    return self.fm.notify("Can't paste_as: file already exists!", bad=True)

	loadable = CopyPasteLoader(self.fm.copy_buffer, new_name, self.fm.do_cut)
	self.fm.loader.add(loadable, append=False)
	self.fm.do_cut = False

    def tab(self, tabnum):
	return self._tab_directory_content()

class paste_as_append(Command):
    """:paste_as_append

    Creates an open_console for the paste_as command, automatically placing the cursor before the file extension.
    """

    def execute(self):
        copy_buffer = tuple(self.fm.copy_buffer)
	if not copy_buffer or len(copy_buffer) != 1:
	    return

        cf = copy_buffer[0]
	#path = cf.relative_path.replace("%", "%%")
	path = cf.relative_path
	if path.find('.') != 0 and path.rfind('.') != -1 and not cf.is_directory:
	    self.fm.open_console('paste_as ' + path, position=(len("paste_as") + 1 + path.rfind('.')))
	else:
	    self.fm.open_console('paste_as ' + path)


def hook_init(fm):
    fm.commands.commands['paste_as'] = paste_as
    fm.commands.commands['paste_as_append'] = paste_as_append

    fm.execute_console("map {key} paste_as_append".format(key=PASTE_AS_APPEND_KEY))

    return HOOK_INIT_OLD(fm)

ranger.api.hook_init = hook_init
