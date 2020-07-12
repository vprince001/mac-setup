echo "
# --- ZSH PLUGINS --- #
"

zshPlugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

for i in "${zshPlugins[@]}"; do
  echo "$i - Enter y to install else press enter"
  read -r response
  if [[ $response == "y" ]]; then
    echo "Installing $i";
    brew install "$i"
  else
    echo "Skipped $i";
  fi
done