echo "
# --- APPLICATIONS --- #
"

echo "Adding homebrew/cask-versions to brew taps"
brew tap homebrew/cask-versions

applications=(
  adoptopenjdk
  alacritty
  docker
  google-chrome
  intellij-idea-ce
  iterm2
  postman
  slack
  virtualbox
  visual-studio-code
  vlc
  zoom
)

for i in "${applications[@]}"; do
  echo "\nDo you want to install $i? [y/n/q]"
  say "Do you want to install $i?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo "\nInstalling $i";
    say "Installing $i";
    brew install "$i" --cask
  elif [[ $response == "q" ]]; then
    exit
  else
    echo "\nSkipped $i";
  fi
done