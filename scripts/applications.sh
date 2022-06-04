echo "
# --- APPLICATIONS --- #
"

echo "Adding homebrew/cask-versions to brew taps"
brew tap homebrew/cask-versions

applications=(
  google-chrome
  virtualbox
  iterm2
  vlc
  visual-studio-code
  slack
  adoptopenjdk
  intellij-idea-ce
  zoomus
  alacritty
  postman
  docker
)

for i in "${applications[@]}"; do
  echo "\nDo you want to install $i? [y/n/q]"
  say "Do you want to install $i?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo "\nInstalling $i";
    say "Installing $i";
    brew cask install "$i"
  elif [[ $response == "q" ]]; then
    exit
  else
    echo "\nSkipped $i";
  fi
done