if [ -e ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  echo "zsh-autosuggestions has not been installed yet. Install it by running:\ngit clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions\nsource ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
