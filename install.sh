echo "# --- HOMEBREW --- #"
if test ! $(which brew); then
  echo "Homebrew is not installed. Would you like to install it? Press y to install else press enter"
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
echo ""

echo "# --- GIT --- #"
if test ! $(which git); then
  echo "Git is not installed. Would you like to install it? Press y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing git..."
    brew install git
    echo "Successfully installed git"
  fi
else
  echo "Git already installed"
fi