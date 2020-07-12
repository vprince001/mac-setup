echo "
# --- HOMEBREW --- #
"

if test ! "$(command -v brew)"; then
  echo "Homebrew is not installed. Press y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Successfully installed Homebrew"
  fi
else
  echo "Homebrew already installed"
fi

echo "Making sure we're using the latest Homebrew"
brew update
echo "Update Complete"

echo "Upgrading any already-installed formulae"
brew upgrade
echo "Upgrade Complete"

echo "Exporting home brew no auto update"
export HOMEBREW_NO_AUTO_UPDATE=1

echo "
# --- GIT --- #
"

if test ! $(command -v git); then
  echo "Git is not installed. Press y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing git..."
    brew install git
    echo "Successfully installed git"
  fi
else
  echo "Git already installed"
fi

echo "
# --- ZSH --- #
"

if test ! $(command -v zsh); then
  echo "Zsh is not installed. Press y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing zsh..."
    brew install zsh
    echo "Successfully installed zsh"

    echo "Installing oh-my-zsh"
    echo "Please enter your name to display in prompt"
    read -r name
    echo "$name" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
else
  echo "Zsh already installed"
fi

echo "
# --- APPLICATIONS --- #
"

echo "Adding homebrew/cask-versions to brew taps"
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
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew cask install "$i"
  else
    echo "Skipped $i";
  fi
done

echo "
# --- CORE UTILS --- #
"

echo "Adding heroku/brew to brew taps"
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
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew install "$i"
  else
    echo "Skipped $i";
  fi
done

echo "
# --- NVM --- #
"

if [[ nvm -ne 0 ]]; then
  echo "NVM is not installed. Press y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
    echo "Successfully installed nvm"
  fi
else
  echo "nvm already installed"
fi

echo "
# --- NPM MODULES --- #
"

npmModules=(
    nyc
    readline-sync
    mocha
    prettier
    chalk
)

for i in "${npmModules[@]}"; do
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew install "$i"
  else
    echo "Skipped $i";
  fi
done

echo "
# --- ZSH PLUGINS --- #
"

zshPlugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

for i in "${zshPlugins[@]}"; do
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew install "$i"
  else
    echo "Skipped $i";
  fi
done

echo "
# --- VIM --- #
"

if test ! $(command -v vim); then
  echo "Vim is not installed. Press y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing vim..."
    brew install vim
    echo "Successfully installed vim"
  fi
else
  echo "Vim already installed"
fi

echo "Upgrading vim"
brew upgrade vim
echo "Upgrade Complete"

echo "
# --- VSCODE PLUGINS --- #
"

echo "Installing command_line_launcher"
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
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    code --install-extension "$i";
  else
    echo "Skipped $i";
  fi
done

echo "
# --- UPDATE ZSHRC --- #
"

echo "Enter y to update zshrc else press enter"
read -r response
if [[ $response == "y" ]]; then
  echo "Adding zshrc settings"
  echo "
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

  echo "Please restart your terminal or enter 'source ~./zshrc' for changes to take effect"
else
  echo "Skipped updating zshrc";
fi

echo "Installation completed"
echo "Thank you"