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
alias ls='exa --group-directories-first'
alias lu='exa -a -T --level=2'
alias PAC='sudo pacman'
alias jrnl='~/.local/bin/jrnl'
alias startvpn='sudo /home/ross/.config/polybar/scripts/startVPN.sh'
alias SS='sudo systemctl'
alias '?'=duck

# Alias to Config settings
alias vimrc='$EDITOR ~/.config/nvim/init.vim'
alias zshrc='$EDITOR ~/.zshrc'
alias bspwmrc='$EDITOR ~/home/ross/.config/bspwm/bspwmrc'
alias sxhrc='$EDITOR ~/home/ross/.config/sxhkd/sxhkdrc'
alias spectrwmrc='$EDITOR ~/.spectrwm.conf'
alias alaconfig='$EDITOR ~/.config/alacritty/alacritty.yml'
alias wmrc='$EDITOR ~/.spectrwm.conf'
alias folderrc='$EDITOR ~/.config/.folderalias'
function take() {
  mkdir -p $@ && cd ${@:$#}
}
function chpwd() {
    emulate -L zsh
    exa --group-directories-first
}
function rmd(){
  rm -Irf $@
}
<<<<<<< HEAD
source ~/.config/.folderalias 
=======
source ~/.config/.folderalias
>>>>>>> 5e5bbe65 ([refactor](nvim) Adds compe and LSP to nvim by lua)
source ~/.env
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.zsh/zsh-vim-mode/zsh-vim-mode.plugin.zsh

echo "$(</home/ross/.scripts/quotes/$(date +"%Y-%m-%d").txt)"
