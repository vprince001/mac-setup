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
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew cask install "$i"
  else
    echo "Skipped $i";
  fi
done