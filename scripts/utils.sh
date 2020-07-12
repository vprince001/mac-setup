echo "
# --- CORE UTILS --- #
"

echo "Adding heroku/brew to brew taps"
brew tap heroku/brew

coreUtils=(
    tig
    tree
    bat
    node
    watch
    ack
    hugo
    heroku
    autojump
    scala
    go
    cmake
    kubernetes-cli
    tmux
    minikube
)

for i in "${coreUtils[@]}"; do
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew install "$i"
  else
    echo "Skipped $i";
  fi
done