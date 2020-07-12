printf "\n# --- HOMEBREW --- #\n"
if test ! $(which brew); then
  printf "Homebrew is not installed. Would you like to install it? Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing homebrew...\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    printf "Successfully installed Homebrew\n"
  fi
else
  printf "Homebrew already installed\n"
fi

printf "Making sure we're using the latest Homebrew\n"
brew update
printf "Update Complete\n"

printf "Upgrading any already-installed formulae\n"
brew upgrade
printf "Upgrade Complete\n"

printf "Exporting home brew no auto update\n"
export HOMEBREW_NO_AUTO_UPDATE=1

printf "\n# --- GIT --- #\n"
if test ! $(which git); then
  printf "Git is not installed. Would you like to install it? Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing git...\n"
    brew install git
    printf "Successfully installed git\n"
  fi
else
  printf "Git already installed\n"
fi

printf "\n# --- ZSH --- #\n"
if test ! $(which zsh); then
  printf "Zsh is not installed. Would you like to install it? Press y to install else press enter\n"
  read -r response
  if [[ $response == "y" ]]; then
    printf "Installing zsh and zsh-completions...\n"
    brew install zsh zsh-completions
    printf "Successfully installed zsh and zsh-completions\n"

    printf "Installing oh-my-zsh\n"
    printf "Please enter your name to display in prompt\n"
    read -r name
    echo "$name" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
else
  printf "Zsh already installed\n"
fi


