# Core Vars
export PULSE_LATENCY_MSEC=30
export EDITOR='nvim'
export HOMEBREW_NO_ANALYTICS=1
export DEFAULT_USER="$(whoami)"
export NVM_AUTO_USE=true

# Mainpathes
export NVM_DIR="$HOME/.nvm"
export USERBINS=~/bins
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH="/usr/local/sbin:$PATH"

# NVM Stuff
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion