zmodload zsh/zprof
# Path to your oh-my-zsh installation.
export ZSH="/Users/saschafuchs/.oh-my-zsh"

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

# Docker Aliases
alias dps="docker ps"
alias dpsa="docker ps -all"
alias di="docker images"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dce="docker-compose exec"

# Git Aliases
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gcm="git commit -m"
alias gcma="git commit -am"
alias gb="git branch"
alias gc="git checkout"
alias gra="git remote add"
alias grr="git remote rm"
alias gpu="git pull"
alias gcl="git clone"
alias gta="git tag -a -m"
alias gf="git reflog"
alias gcl="git clone"
alias greset="git reset --hard"
alias gclean="git clean -dfx"
alias gcleanreset="git reset --hard && git clean -dfx"

# Tooling Aliases
alias com="ranger"
alias disc="ncdu"
alias cat="bat"
alias top="htop"
alias woff="woff2_compress ."

alias vim="nvim"

# Copy SSH Key to Clipboard
alias sshcopy="pbcopy < ~/.ssh/id_rsa.pub"
# Copy Path to Clipboard
alias copypath="pwd|pbcopy"

# Empty all trashfiles
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# all in one homebrew, gem update commands
alias brewup='brew update && brew upgrade && brew cleanup'
alias gemup='gem update --system && gem update && gem cleanup'
alias npmup='npm -g cache clean && npm -g update && npm-check-updates -u && npm install'
alias sysup='sudo softwareupdate -i -a'
alias upall='sysup && brewup && gemup && npmup'

# Kill all the tabs in Chrome to free up memory
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
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

# Set default editor to nvim
export EDITOR='nvim'

# Enabled true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

DISABLE_CORRECTION="true"
unsetopt correct

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.config/nvcode/utils/bin:$PATH

eval "$(starship init zsh)"
