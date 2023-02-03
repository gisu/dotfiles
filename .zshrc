# Fig pre block. Keep at the top of this file.
# ZSH_DISABLE_COMPFIX="true"
# Enable level10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
zmodload zsh/zprof 
# Path to your oh-my-zsh installation.
export ZSH="/Users/saschafuchs/.oh-my-zsh"

# Display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# export TERM="xterm-256color"
# ZSH_THEME="spaceship"

# ALIASES

# Copy Public Key to Server
handshake() {
  if [ -n "$1" ]; then
    ssh-copy-id -i ~/.ssh/$i
  else
    ssh-copy-id -i ~/.ssh/id
  fi
}

# Make Dir and Jump in
mcd() {
  mkdir -p $1
  cd $1
}

# Helper
alias ssh!="nvim ~/.ssh/config"
alias sshhosts!="nvim ~/.ssh/known_hosts"
alias zsh!="nvim ~/.zshrc"
alias reload!="source ~/.zshrc"
alias vim!="nvim ~/.vim/vimrc"

# NPM Workflow Aliases
alias init="npm run init"
alias dev="npm run dev"
alias build="npm run build && npm run start"
alias story="npm run storybook"
alias nodekill="killall node"
alias localhost="open http://localhost:3000"
alias listnpmlinks="npm ls -g --depth=0 --link=true"

#yabai
alias ybstart="brew services start yabai && brew services start skhd"
alias ybstop="brew services stop yabai && brew services stop skhd"
alias ybrestart="brew services restart yabai && brew services restart skhd"

# Tooling Aliases
alias com="ranger"
alias disc="ncdu"
alias cat="bat"
alias top="htop"
alias woff="woff2_compress ."

# Copy SSH Key to Clipboard
alias sshcopy="pbcopy < ~/.ssh/id_rsa.pub"
alias unsafeChrome="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir=\"/tmp/chrome_dev_test\" --disable-web-security"
# VARIABLES 

# Core Vars
export PULSE_LATENCY_MSEC=30
export HOMEBREW_NO_ANALYTICS=1 
export DEFAULT_USER="$(whoami)"
export NVM_AUTO_USE=true

# Mainpathes
export NVM_DIR="$HOME/.nvm"
export USERBINS=~/bins
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$GOBIN
export PATH="/usr/local/sbin:$PATH"


# SSH Agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa saschafuchs_rsa

# ZSH Plugins
plugins=(git git-extras npm ssh-agent node brew z)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. /opt/homebrew/etc/profile.d/z.sh

# NPMCommit
# $1 type
# $2 message
# $3 version
npmcommit() {
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
  then
      echo "need more parameters"
      exit 1
  fi

  if [ "$1" != "feature" ] && [ "$1" != "fix" ] && [ "$1" != "refactor" ] && [ "$1" != "docs" ] && [ "$1" != "build" ] && [ "$1" != "chore" ] && [ "$1" != "perf" ] && [ "$1" != "style" ] && [ "$1" != "test" ]
  then
      echo "use feature, fix, refactor, docs, build, chore, perf, style, test"
      exit 1
  fi

  if [ "$3" != "patch" ] && [ "$3" != "minor" ] && [ "$3" != "major" ]
  then
      echo "use version minor major patch"
      exit 1
  fi

  git add .
  git commit -m "$1: $2"
  npm version $3
  git push
}

# Sketchybar interactivity overloads
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

alias n="nnn"
function nnn () {
    command nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
    fi
}

# Fancy sketchybar commands
function margin () {
  if [ $1 = "on" ]; then
    yabai -m config top_padding 20
    sketchybar --animate sin 30 --bar margin=10 y_offset=10 corner_radius=9
  else
    yabai -m config top_padding 10
    sketchybar --animate sin 30 --bar margin=0 y_offset=0 corner_radius=0
  fi
}

function zen () {
  ~/.config/sketchybar/plugins/zen.sh $1
}

# Set default editor to nvim
export EDITOR='nvim'

# Enabled true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Aliases
alias vim="nvim"

DISABLE_CORRECTION="true"
unsetopt correct
# SPACESHIP_PROMPT_ASYNC=false

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.config/nvcode/utils/bin:$PATH

source /Users/saschafuchs/.config/broot/launcher/bash/br

eval "$(starship init zsh)"
