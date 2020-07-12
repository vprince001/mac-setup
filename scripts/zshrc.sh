echo "
# --- UPDATE ZSHRC --- #
"

echo "Enter y to update zshrc else press enter"
read -r response
if [[ $response == "y" ]]; then
  echo "Adding zshrc settings"
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