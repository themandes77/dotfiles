alias ls="eza -lF -a --icons"
alias vi="nvim"
alias fman="compgen -c | fzf | xargs man"
# alias fzv="nvim $(fzf --preview bat --style=numbers --color=always {})"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin"

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
