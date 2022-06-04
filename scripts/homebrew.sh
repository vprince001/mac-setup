echo "
# --- HOMEBREW --- #
"

if test ! "$(command -v brew)"; then
  echo "Homebrew is not installed. Installing Homebrew"
  say "Homebrew is not installed. Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Successfully installed Homebrew"
  say "Successfully installed Homebrew"
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