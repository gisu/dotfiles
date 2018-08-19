# Core Aliases

alias sshconf="vim ~/.ssh/config"
alias knowhosts="vim ~/.ssh/known_hosts"
alias zshconf="vim ~/.zshrc"
alias aliasconf="vim ~/.zsh_files/aliases.zsh"
alias reload!="source ~/.zshrc"

# Copy Public Key to Server
handshake() {
  if [ -n "$1" ]; then
    ssh-copy-id -i ~/.ssh/$i
  else
    ssh-copy-id -i ~/.ssh/id
  fi
}

# Copy Files or Folder to lokal directory
# $1: Host
# $2: Path from Copieed Folder or File
# $3: Targetfolder
# $4: Port (Optioanl)
copyfrom() {
  if [ ! -z $4 ]; then
    port="-P $4"
  else
    port=""
  fi

  scp -r "$port" "$1":"$2" "$3"
}

# Copy file or folder to server
# $1 File or Folder
# $2 Host
# $3 Targetfolder
# $4: Port (Optional)
copyto() {
  if [ ! -z $4 ]; then
    port="-P $4"
  else
    port=""
  fi

  scp -r "$port" "$1" "$2":"$3"
}

# Convert Files Name to Lowercase
alias lowercase='for i in *; do mv "$i" "$(echo $i|tr A-Z a-z)"; done'

# Make Dir and Jump in
mcd() {
  mkdir -p $1
  cd $1
}

# NPM Workflow Aliases
alias init="npm run init"
alias dev="npm run dev"
alias deploy="npm run deploy"

# Directoy Aliases
alias cdwork="~/work/"
#alias cdpro1="~/work/project1/page/src/"

# Tooling Aliases
alias hacker="haxor-news"
alias com="ranger"
alias disc="ncdu"
alias browser="browsh"
alias chat="weechat"
alias reddit="rtv"
alias v="nvim"
alias kittn="yo kittn"
alias gitc="lazygit"

# Database Aliases
alias dbstart="brew services start mysql@5.7"
alias dbstop="brew services stop mysql@5.7"
alias db="mycli -uroot -proot"

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

# Valet Aliases
alias vs="valet start"
alias vd="valet stop"
alias vl="valet link"
alias vls="valet links"
alias vul="valet unlink"
alias vse="valet secure"
alias vsu="valet unsecure"

# Tmux Aliases
alias tmuxn="tmux new -s"
alias tmuxl="tmux ls"
alias tmuxa="tmux attach"
alias tmuxs="tmux switch -t"
alias tmuxks="tmux kill-session -t"

# Yarn Aliases
alias ya="yarn add"
alias yan="yarn add --dev"
alias yr="yarn remove"
alias yu="yarn upgrade"
alias yul="yarn upgrade --latest"
alias yui="yarn upgrade-interactive --latest"

# Tasks Management
psg() {
  if [ -n "$1" ]; then
    ps aux | grep $1
  else
    ps aux
  fi
}

# Funpart
alias weather="curl wttr.in/"
