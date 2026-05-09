current_date_time=$(date)

echo "
⠀⣄⣼⣿⡆⠀⠀⠀⠀⠀⠀⠀⠰⢿⣷⣦⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠈⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢹⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠸⣿⣟⠀⣠⣤⣴⣶⣶⡶⠶⠾⠾⠶⢼⣿⣧⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⢻⣿⣿⣿⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⢿⣶⡀⠀⠀⠀⠀⠀⠀
⠀⠀⢼⣿⡧⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣀⠀⠀⠀⠀⠀
⠀⠀⠈⣿⣷⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⠀⠀⠀⠀⠀
⠀⠀⠀⢹⣿⣇⠀⠀⣀⣶⣿⡿⠿⠿⣷⣦⣤⠀⠀⠀⠀⢰⣴⣾⣿⢷⣤⡀⠀⠀
⠀⠀⠀⠀⢿⣿⡖⣸⣿⡟⠁⠀⠀⠀⠀⠻⣿⣦⠀⠀⢸⣿⠟⠀⠀⠀⠈⢿⡆⠀
⠀⠀⠀⠀⢘⣿⣏⣿⡟⠀⣀⣄⠀⠀⠀⠀⣹⣿⡇⠀⣿⣿⠀⠀⠀⠀⣠⡄⢻⡄
⠀⠀⠀⠀⠈⣹⣿⢻⣿⡄⠈⠁⠀⠀⠀⠀⣿⣿⠃⠀⢹⣻⣇⠀⠀⠀⠀⣠⡿⠃
⠀⠀⠀⠀⠀⠙⣿⣏⢻⣿⣦⣄⢀⣀⣠⣼⡿⠛⣤⣠⡀⠙⠿⣷⣶⣶⠾⠟⠁⠀
⠀⠀⠀⠀⠀⠀⢹⣿⡅⠈⠛⣿⣿⡟⠛⢫⠀⢠⣿⠋⣥⣤⣤⣿⡟⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⣿⠥⠀⣴⣶⣶⡿⠿⠿⢿⣿⣿⣿⣿⠿⠿⠏⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⣿⣷⣾⢻⣿⣿⡟⠀⠀⠸⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢘⣿⣿⣿⠀⢿⡹⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⡠⣈⣿⣿⠏⠀⡸⠟⣹⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢹⣿⣷⣶⠷⣶⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣿⣿⠏⠀⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin"

export EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"
export SUDO_EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"
export VISUAL="$HOME/.local/share/bob/nvim-bin/nvim"

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
eval "$(zoxide init zsh)"

source /home/mandes/.zprofile

# opencode
export PATH=/home/mandes/.opencode/bin:$PATH

export PATH=$PATH:/home/mandes/.spicetify
