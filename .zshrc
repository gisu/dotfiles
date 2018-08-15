# Path to your oh-my-zsh installation.
export ZSH="/Users/saschafuchs/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
export TERM="xterm-256color"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Source ZSH Config
if [ -e $ZSH/oh-my-zsh.sh ]; then
     source $ZSH/oh-my-zsh.sh
fi 

# Load Aliases
if [ -e ~/.zsh_files/aliases.zsh ]; then
  source ~/.zsh_files/aliases.zsh
fi

# Load Variables
if [ -e ~/.zsh_files/variables.zsh ]; then
  source ~/.zsh_files/variables.zsh
fi

# Load Tools
if [ -e ~/.zsh_files/tools.zsh ]; then
  source ~/.zsh_files/tools.zsh
fi

# Load Powerline Config
if [ -e ~/.zsh_files/plconf.zsh ]; then
  source ~/.zsh_files/plconf.zsh
fi

# ZSH Plugins 
plugins=(git git-extras git-flow github npm osx ssh-agent gem node zsh-autosuggestions docker-compose docker docker-machine autojump brew zsh-nvm)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
