echo "
# --- CORE UTILS --- #
"

echo "Adding heroku/brew to brew taps"
brew tap heroku/brew

coreUtils=(
    ack
    autojump
    bat
    cmake
    go
    heroku
    hugo
    kubernetes-cli
    minikube
    node
    scala
    tig
    tmux
    tree
    watch
)

for i in "${coreUtils[@]}"; do
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