# Load completion
autoload -Uz compinit && compinit

# Load Prompt
autoload -Uz promptinit; promptinit
# autoload -U promptinit; promptinit
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
alias py='python3'
alias PAC='sudo pacman'
alias jrnl='~/.local/bin/jrnl'
alias SS='sudo systemctl'
alias '?'=duck

#Alias for better alternatives
alias ls='exa --group-directories-first'
alias lu='exa -a -T --level=2'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias top='gtop'
alias find='fd'
alias cat='bat'

# Alias to Config settings
alias vimrc='$EDITOR ~/.config/nvim/init.vim'
alias zshrc='$EDITOR ~/.zshrc'
alias bspwmrc='$EDITOR ~/.config/bspwm/bspwmrc'
alias sxhrc='$EDITOR ~/.config/sxhkd/sxhkdrc'
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
eval "$(fnm env --use-on-cd)"
source ~/.config/folderalias
# source ~/.env
source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.config/workenv
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ${HOME}/.zsh/zsh-vim-mode/zsh-vim-mode.plugin.zsh

echo "$(<~/.scripts/quotes/$(date +"%Y-%m-%d").txt)"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
