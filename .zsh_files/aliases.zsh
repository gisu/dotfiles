# Core Aliases

alias sshconf="vim ~/.ssh/config"
alias knowhosts="vim ~/.ssh/known_hosts"
alias zshconf="vim ~/.zshrc"
alias reload!="source ~/.zshrc"

# NPM Workflow Aliases
alias init="npm run init"
alias dev="npm run dev"
alias deploy="npm run deploy"

# NPM / Yarn Aliases
alias yui="yarn upgrade-interactive"

# Directoy Aliases
alias work="~/Develop/private"

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
alias 'dcu=docker-compose up -d'
alias 'dcd=docker-compose down'
alias 'dce=docker-compose exec'

# Git Aliases
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias 'gcm=git commit -m'
alias 'gcma=git commit -am'
alias 'gb=git branch'
alias 'gc=git checkout'
alias 'gra=git remote add'
alias 'grr=git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gcl='git clone'
alias greset="git reset --hard"
alias gclean="git clean -dfx"
alias gcleanreset="git reset --hard && git clean -dfx"
# Valet Aliases
alias vs="valet start"
alias vd="valet stop"
alias 'vl=valet link'

# Tmux Aliases
alias 'tmuxs=tmux new -s'
alias tmuxl="tmux ls"
alias tmuxa="tmux attach"
alias 'tmuxs=tmux switch -t'
alias 'tmuxks=tmux kill-session -t'
