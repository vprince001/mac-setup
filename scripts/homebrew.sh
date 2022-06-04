echo "
# --- HOMEBREW --- #
"

if test ! "$(command -v brew)"; then
  echo "Homebrew is not installed. Do you want to install Homebrew? [y/n/q]"
  say "Do you want to install Homebrew?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo ""
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Successfully installed Homebrew"
    say "Successfully installed Homebrew"
  elif [[ $response == "q" ]]; then
    exit
  fi
else
  echo "Homebrew already installed"
  echo "Making sure we're using the latest Homebrew"
  brew update
  echo "Update Complete"

  echo "Upgrading any already-installed formulae"
  brew upgrade
  echo "Upgrade Complete"

  echo "Exporting home brew no auto update"
  export HOMEBREW_NO_AUTO_UPDATE=1
fi