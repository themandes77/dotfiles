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
export PATH="$HOME/.config/emacs/bin:$PATH"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

export EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"
export SUDO_EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"
export VISUAL="$HOME/.local/share/bob/nvim-bin/nvim"

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

source /home/mandes/.zprofile

# opencode
export PATH=/home/mandes/.opencode/bin:$PATH

export PATH=$PATH:/home/mandes/.spicetify
unset SSH_ASKPASS

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
