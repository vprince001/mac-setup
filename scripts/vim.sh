echo "
# --- VIM --- #
"

if test ! $(command -v vim); then
  echo "\nVim is not installed. Do you want to install Vim? [y/n/q]"
  say "Do you want to install Vim?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo "Installing vim..."
    say "Installing vim"
    brew install vim
    echo "Vim Successfully installed"
    say "Vim Successfully installed"
  elif [[ $response == "q" ]]; then
    exit
  fi
else
  echo "Vim already installed"
fi

echo "Upgrading vim"
brew upgrade vim
echo "Upgrade Complete"