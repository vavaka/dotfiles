# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vagrant flux)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# additional zsh completions (Homebrew)
fpath=(~/.zsh/completion $fpath) 

# add user specific binaries to PATH
export PATH="$PATH:$HOME/bin"

# do not remember commands which starts with space character
export HISTCONTROL=ignoreboth

# disable Software Flow control with Ctrl-s and Ctrl-q keys,
# this enables to use these keys in terminal for other purposes,
# i.e using Ctrl-s for searching in terminal text editor
stty -ixon

# fasd configuration
eval "$(fasd --init auto)"

# fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# in commands below "." is a search pattern
export FZF_DEFAULT_COMMAND="fd --hidden --follow --no-ignore-vcs --exclude '.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --follow --no-ignore-vcs --exclude '.git' . $HOME"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# hh configuration
export HISTFILE=~/.zsh_history
export HH_CONFIG=hicolor,blacklist,rawhistory

# rbenv
export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/usr/local/Cellar/rbenv/1.1.0/libexec/../completions/rbenv.zsh'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

# kerl
DEFAULT_KERL_INSTALLATION=19.2
if [ -d ~/.kerl/installations/${DEFAULT_KERL_INSTALLATION} ]
then
    source ~/.kerl/installations/${DEFAULT_KERL_INSTALLATION}/activate
fi

# kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# nvm
export NVM_DIR=~/.nvm
# default load method which slows down shell startup
# instead use `loadnvm` alias (which is defined below) to load nvm manually
# as suggested at https://github.com/robbyrussell/oh-my-zsh/issues/5327#issuecomment-248836398
#source $(brew --prefix nvm)/nvm.sh

# call nvm use automagically when entering a directory containing .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
    # try to load nvm version only if `nvm` exists in a PATH
    # it could be missing beacus of manual nvm loading, see above for details
    if [ -x "$(command -v nvm)" ]; then
        if [[ -f .nvmrc && -r .nvmrc ]]; then
            nvm use
        elif [[ $(nvm version) != $(nvm version default)  ]]; then
            echo "Reverting to nvm default version"
            nvm use default
        fi
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# android
export ANDROID_HOME="$HOME/opt/android-sdk"

#--------------------------------
# ALIASES
#--------------------------------

# system aliases
alias l='ls -hal'

# vagrant aliases
alias vu="vagrant up"
alias vup="vagrant up --provision"
alias vp="vagrant provision"
alias vs="vagrant ssh"
alias vh="vagrant halt"

# nvm aliass
alias loadnvm=". /usr/local/opt/nvm/nvm.sh"


#--------------------------------
# KEY BINDINGS
#--------------------------------

# "\C-" control prefix
# "\M-" meta prefix
# "\e"  an escape character

bindkey '^u' backward-kill-line
bindkey '\eu' kill-whole-line

# delete long word backward
x-bash-backward-delete-word () {
    local WORDCHARS="~!@#$%^&*()-_=+[]{}<>;:.?"
    zle backward-delete-word
}

zle -N x-bash-backward-delete-word
bindkey '^w'  x-bash-backward-delete-word

