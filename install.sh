printf "\n# --- HOMEBREW --- #\n"
if test ! "$(command -v brew)"; then
  printf "Homebrew is not installed. Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing homebrew...\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    printf "Successfully installed Homebrew\n"
  fi
else
  printf "Homebrew already installed\n"
fi

printf "Making sure we're using the latest Homebrew\n"
brew update
printf "Update Complete\n"

printf "Upgrading any already-installed formulae\n"
brew upgrade
printf "Upgrade Complete\n"

printf "Exporting home brew no auto update\n"
export HOMEBREW_NO_AUTO_UPDATE=1

printf "\n# --- GIT --- #\n"
if test ! $(command -v git); then
  printf "Git is not installed. Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing git...\n"
    brew install git
    printf "Successfully installed git\n"
  fi
else
  printf "Git already installed\n"
fi

printf "\n# --- ZSH --- #\n"
if test ! $(command -v zsh); then
  printf "Zsh is not installed. Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing zsh...\n"
    brew install zsh
    printf "Successfully installed zsh\n"

    printf "Installing oh-my-zsh\n"
    printf "Please enter your name to display in prompt\n"
    read -r name
    echo "$name" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
else
  printf "Zsh already installed\n"
fi

printf "\n# --- APPLICATIONS --- #\n"
printf "Adding homebrew/cask-versions to brew taps\n"
brew tap homebrew/cask-versions

applications=(
  google-chrome
  virtualbox
  iterm2
  vlc
  visual-studio-code
  slack
  adoptopenjdk
  intellij-idea-ce
  zoomus
  alacritty
  postman
  docker
)

for i in "${applications[@]}"; do
  printf "\n%s - Enter y to install else press enter\n" "$i"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing %s\n" "$i";
    brew cask install "$i"
  else
    printf "Skipped %s\n" "$i";
  fi
done

printf "\n# --- CORE UTILS --- #\n"
printf "Adding heroku/brew to brew taps\n"
brew tap heroku/brew

coreUtils=(
    tig
    tree
    bat
    node
    watch
    ack
    hugo
    heroku
    autojump
    scala
    go
    cmake
    kubernetes-cli
    tmux
    minikube
)

for i in "${coreUtils[@]}"; do
  printf "\n%s - Enter y to install else press enter\n" "$i"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing %s\n" "$i";
    brew install "$i"
  else
    printf "Skipped %s\n" "$i";
  fi
done

printf "\n# --- NVM --- #\n"
if [[ nvm -ne 0 ]]; then
  printf "NVM is not installed. Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing nvm...\n"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
    printf "Successfully installed nvm\n"
  fi
else
  printf "nvm already installed\n"
fi

printf "\n# --- NPM MODULES --- #\n"

npmModules=(
    nyc
    readline-sync
    mocha
    prettier
    chalk
)

for i in "${npmModules[@]}"; do
  printf "\n%s - Enter y to install else press enter\n" "$i"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing %s\n" "$i";
    brew install "$i"
  else
    printf "Skipped %s\n" "$i";
  fi
done

printf "\n# --- ZSH PLUGINS --- #\n"

zshPlugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

for i in "${zshPlugins[@]}"; do
  printf "\n%s - Enter y to install else press enter\n" "$i"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing %s\n" "$i";
    brew install "$i"
  else
    printf "Skipped %s\n" "$i";
  fi
done

printf "\n# --- VIM --- #\n"
if test ! $(command -v vim); then
  printf "Vim is not installed. Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing vim...\n"
    brew install vim
    printf "Successfully installed vim\n"
  fi
else
  printf "Vim already installed\n"
fi

printf "Upgrading vim\n"
brew upgrade vim
printf "Upgrade Complete\n"

printf "\n# --- VSCODE PLUGINS --- #\n"

printf "Installing command_line_launcher\n"
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code

vscodePlugins=(
    peterjausovec.vscode-docker
    tootone.org-mode
    esbenp.prettier-vscode
    ms-mssql.mssql
    patbenatar.advanced-new-file
    coenraads.bracket-pair-colorizer
    azemoh.one-monokai
    formulahendry.auto-rename-tag
    2gua.rainbow-brackets
    pranaygp.vscode-css-peek
)

for i in "${vscodePlugins[@]}"; do
  printf "\n%s - Enter y to install else press enter\n" "$i"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing %s\n" "$i";
    code --install-extension "$i";
  else
    printf "Skipped %s\n" "$i";
  fi
done

printf "\n# --- UPDATE ZSHRC --- #\n"

printf "Enter y to update zshrc else press enter\n"
read -r response
if [[ $response == "y" ]]; then
  printf "Adding zshrc settings\n"
  echo "
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
printf "Please restart your terminal or enter 'source ~./zshrc' for changes to take effect"
else
  printf "Skipped updating zshrc\n";
fi

printf "Installation completed\n"
printf "Thank you\n"