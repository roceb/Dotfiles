# Load completion
autoload -Uz compinit && compinit

# Load Prompt
autoload -Uz promptinit; promptinit

# Set fpath for prompt
fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
fpath+=$HOME/.zsh/pure

# Set history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt appendhistory

# Prompt settings
prompt spaceship
# prompt pure
SPACESHIP_VI_MODE_SHOW=false
# Auto completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey -v
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Alias
alias pls='sudo'
alias h='cd ~/'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias c='clear'
alias rf='source ~/.zshrc'
alias v='$EDITOR'
alias sv='sudo $EDITOR'
alias vim='$EDITOR'
alias venv='source env/bin/activate'
alias py='python'
alias playing='spotifycli --status'
alias play='spotifycli --play'
alias next='spotifycli --next'
alias prev='spotifycli --prev'
alias pause='spotifycli --pause'
alias ls='exa -a --group-directories-first'
alias lu='exa -a -T --level=2'
alias PAC='sudo pacman'
alias jrnl='~/.local/bin/jrnl'
alias startvpn='sudo /home/ross/.config/polybar/scripts/startVPN.sh'
alias SS='sudo systemctl'

# Alias to Config settings
alias vimrc='$EDITOR ~/.vimrc'
alias zshrc='v ~/.zshrc'
alias bspwmrc='nvim ~/home/ross/.config/bspwm/bspwmrc'
alias spectrwmrc='vim ~/.spectrwm.conf'
alias alaconfig='vim ~/.config/alacritty/alacritty.yml'
alias wmrc='vim ~/.spectrwm.conf'
# Alias for folders

alias Pr='cd ~/Programming'
alias Prn='cd ~/Programming/Nodejs'
alias Music='cd ~/Music'
alias Pack='cd ~/Programming/packages'
alias notes='cd ~/Programming/notes'
alias conf='cd ~/.config'
function take() {
  mkdir -p $@ && cd ${@:$#}
}

python /home/ross/.scripts/qod.py
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.zsh/zsh-vim-mode/zsh-vim-mode.plugin.zsh
