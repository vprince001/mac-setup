echo "
# --- NPM MODULES --- #
"

npmModules=(
    chalk
    mocha
    nyc
    prettier
    readline-sync
)

for i in "${npmModules[@]}"; do
  if test ! $(command -v $i); then
  echo "\n$i is not installed. Do you want to install $i? [y/n/q]"
  say "Do you want to install $i?"
  read -r -n1 response
    if [[ $response == "y" ]]; then
      echo "\nInstalling $i";
      say "Installing $i";
      brew install "$i"
    elif [[ $response == "q" ]]; then
      exit
    else
      echo "\nSkipped $i";
    fi
  else
    echo "\n$i already installed";
  fi
done