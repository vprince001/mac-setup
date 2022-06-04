echo "
# --- GIT --- #
"

if test ! $(command -v git); then
  echo "Git is not installed. Do you want to install Git? [y/n/q]"
  say "Do you want to install Git?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo "Installing git..."
    brew install git
    echo "Successfully installed git"
    say "Successfully installed git"
  elif [[ $response == "q" ]]; then
    exit
  fi
else
  echo "Git already installed"
fi