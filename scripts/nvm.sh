echo "
# --- NVM --- #
"

if [[ nvm -ne 0 ]]; then
  echo "\nNVM is not installed. Do you want to install NVM? [y/n/q]"
  say "Do you want to install NVM?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo "\nInstalling nvm..."
    say "Installing nvm"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
    echo "\nNVM Successfully installed"
    say "\nNVM Successfully installed"
  elif [[ $response == "q" ]]; then
    exit
  fi
else
  echo "nvm already installed"
fi