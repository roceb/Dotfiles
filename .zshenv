export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export VIDEO="mpv"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="bspwm"

# Path
typeset -U PATH path
path=("/home/ross/spicetify-cli" "/usr/local/go/bin" "/home/ross/Programming/Go" "/home/ross/.local/bin" "$path[@]")

export PATH
