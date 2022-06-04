echo "
# --- UPDATE ZSHRC --- #
"

echo "\nDo you want to update zshrc? [y/n/q]"
say "Do you want to update zshrc?"
read -r -n1 response
if [[ $response == "y" ]]; then
  echo "\nAdding zshrc settings"
  echo "
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

  echo "Please restart your terminal or enter 'source ~./zshrc' for changes to take effect"
else
  echo "Skipped updating zshrc";
fi