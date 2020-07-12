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