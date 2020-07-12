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