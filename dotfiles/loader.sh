echo dotfiles/loader.$shell is running!

# ===========================================
# Host-specific config (TODO: create error-function):
# ===========================================
hostname >/dev/null 2>&1 ; [[ "$?" -eq 127 ]] && echo 'ERROR: "hostname" not found, it is provided by "yay -S inetutils"' >/dev/stderr
SHELLDIR="$DOTDIR/shell"
[ ! -d "$SHELLDIR" ] && echo "ERROR: Directory \"$SHELLDIR\" does not exist!" >/dev/stderr

# Source $file (hostname + shell):
file="$SHELLDIR/$(hostname).$shell"
[[ -f "$file" ]] && source "$file" || echo "ERROR: \"$file\" does not exist!" >/dev/stderr

# Shared stuff (zsh+bash):
file="$SHELLDIR/bashZsh_common.sh"
[[ -f "$file" ]] && source "$file" || echo "ERROR: \"$file\" does not exist!" >/dev/stderr
