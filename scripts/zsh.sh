echo "
# --- ZSH --- #
"

if test ! $(command -v zsh); then
  echo "Zsh is not installed. Do you want to install Zsh? [y/n/q]"
  say "Do you want to install Zsh?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo "Installing zsh..."
    brew install zsh
    echo "Successfully installed zsh"

    echo "Installing oh-my-zsh"
    echo "Please enter your name to display in prompt"
    say "Please enter your name"
    read -r name
    echo "$name" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  elif [[ $response == "q" ]]; then
    exit
  fi
else
  echo "Zsh already installed"
fi