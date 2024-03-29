#!/usr/bin/env bash

# Update and upgrade Homebrew.
brew update
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install neovim
brew install grep
brew install openssh
brew install screen
brew install python
brew install go
brew install elm
brew install mysql@5.7

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz
brew install spaceship

# Install Lazygit
brew tap jesseduffield/lazygit
brew install lazygit

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install ghi
brew install git
brew install git-lfs
brew install translate-shell
brew install imagemagick --with-webp
brew install reattach-to-user-namespace
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install webp
brew install httpie
brew install ranger
brew install rtv
brew install autojump
brew install jq
brew install ctop
brew install dasht
brew install mycli
brew install peco
brew install hub
brew install s-search
brew install icdiff
brew install mailhog
brew install mas
brew install newsboat
brew install neomutt
brew install bat
brew install htop
brew install fzf
brew install fd
brew install tldr
brew install lazydocker

# Install Yabai
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# Install Cask
brew install caskroom/cask/brew-cask

# Apps
apps=(
  raycast
  warp
  google-chrome
  ColorpickerSkalacolor
  firefox
  quicklook-json
  docker
  visual-studio-code
  obsidian
  setapp
  figma
  discord
  slack
  deepl
  1password/tap/1password-cli
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package
defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder

# Remove outdated versions from the cellar.
brew cleanup


