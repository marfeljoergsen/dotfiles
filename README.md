# Dotfiles repo:

* Everything managed by "chezmoi": [https://www.chezmoi.io/](https://www.chezmoi.io/)

* See quick-start guide: [Quick start - chezmoi](https://www.chezmoi.io/quick-start/) ; user-guide: [Command overview - chezmoi](https://www.chezmoi.io/user-guide/command-overview/) and reference: [Reference - chezmoi](https://www.chezmoi.io/reference/)

* On Arch Linux install the prerequisite package with: yay -S chezmoi

## Instructions:
1. cd ~/.local/share
2. git clone git@github.com:marfeljoergsen/dotfiles.git
   The cloned files should now be in $HOME/.local/share/chezmoi, next symlink:
3. ln -s ~/.local/share/chezmoi/dotfiles ~
4. Modify ~/.zshrc and ~/.bashrc to automatically source the correct files:

```bash
# ===========================================
# Host-specific config (TODO: create error-function):
# ===========================================
shell=$(basename "$0")
DOTDIR="$HOME/dotfiles"
SNAME="$DOTDIR/loader.sh"
[ ! -d "$DOTDIR" ] && echo "ERROR: Directory \"$DOTDIR\" does not exist!" >/dev/stderr
[ ! -f "$SNAME" ] && echo "ERROR: File \"$SNAME\" does not exist (cannot be sourced)!" >/dev/stderr || . "$SNAME"
# ====================================================
```