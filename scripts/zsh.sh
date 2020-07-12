echo "
# --- ZSH --- #
"

if test ! $(command -v zsh); then
  echo "Zsh is not installed. Press y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing zsh..."
    brew install zsh
    echo "Successfully installed zsh"

    echo "Installing oh-my-zsh"
    echo "Please enter your name to display in prompt"
    read -r name
    echo "$name" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
else
  echo "Zsh already installed"
fi