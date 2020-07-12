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