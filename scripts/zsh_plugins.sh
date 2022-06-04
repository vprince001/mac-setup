echo "
# --- ZSH PLUGINS --- #
"

zshPlugins=(
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

for i in "${zshPlugins[@]}"; do
  echo "\nDo you want to install $i? [y/n/q]"
  say "Do you want to install $i?"
  read -r -n1 response
  if [[ $response == "y" ]]; then
    echo "\nInstalling $i";
    say "Installing $i";
    brew install "$i"
  else
    echo "Skipped $i";
  fi
done