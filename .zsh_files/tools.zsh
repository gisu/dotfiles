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
