echo "
# --- NPM MODULES --- #
"

npmModules=(
    nyc
    readline-sync
    mocha
    prettier
    chalk
)

for i in "${npmModules[@]}"; do
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew install "$i"
  else
    echo "Skipped $i";
  fi
done