

export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=/usr/bin/nvim
#export EDITOR=`which vim`

alias less='less --RAW-CONTROL-CHARS'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias mouse-find-cursorRED='find-cursor --repeat 0 --follow --distance 1 --line-width 16 --size 16 --color red'
#alias ag='ag --color-line-number --color-match --color-path'
#alias ag='ag --color-match --color-path'

alias cdf='cd $(dirname $(fzf))'
alias cdd='cd $(find . -type d | fzf)'
alias vedit='vim $(fzf)'
alias nvedit='nvim $(fzf)'
# make "nnn"/"n" work with MC, under zsh as main shell (WARNING: This has
#   nothing to do with missing subshell or issues with CTRL+O terminal):
#alias mc='SHELL="/usr/bin/bash -c source ~/bashZsh_source_shell.sh" mc'
#alias mc='SHELL=/usr/bin/bash mc'

# --- nnn: cd-on-quit (MUST start with "n" and MUST quit with CTRL+G!)
#     Updated info on: https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.bash_zsh
#     Option description: https://github.com/jarun/nnn/wiki/Concepts
#     nnn starts with options:
#        "-H", to show hidden files
#        "-A", to avoid auto-entering directories with a single match
# --- NNN: Remember export NNN_OPTS="H" to show hidden files!
n ()
{
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef
    # --- nnn option "-A" means avoid auto-entering directories with a single match
    #     See more: https://github.com/jarun/nnn/wiki/Concepts
    nnn -H -A "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
#export NNN_OPTS="H"
# --- NNN: Remember export NNN_OPTS="H" to show hidden files!


# --- Lazygit - change directory on exit + shortcut:

setwork() {
    if [ -z "$ttasks" ]; then
        echo "ERROR: \"\$ttasks\" environment variable/directory isn''t set..."
	return 1
    elif [ ! -d "$ttasks" ]; then 
        echo "ERROR: \"\$ttasks\" environment variable/directory is set, but is not a directory..."
	return 1
    fi
    if [ -z "$1" ]; then
        echo "Input argument (directory) NOT set, cannot continue - in future, might be using pwd: $(pwd)"
	return 1
    elif [ ! -d "$1" ]; then
        echo "\$1 is INVALID valid dir, cannot use: $1!"
	return 1
    else
        echo "Setting working directory to: \"$ttasks/$1\"..."
	ln -sfn "$1" "$ttasks/latest"
    fi
}


# ARTICLE "How To Speed Up Compilation Process When Installing
#   Packages From AUR" (modified /etc/makepkg.conf file where
#   #MAKEFLAGS="-j2" was changed into:
#   MAKEFLAGS="-j$(nproc)". Furthermore, caching is enabled by
#   removing the exclamation mark, for the line: BUILDENV=(fakeroot
#   !distcc color ccache check !sign)...
#export PATH="/usr/lib/ccache/bin/:$PATH"
export PATH="/usr/lib/ccache/bin/:$PATH:$HOME/bin"

#echo '--- startxfce4'
alias awesomehelp='head -24  ~/.config/awesome/rc.lua'

echo " ---=== FZF ===---"
echo '<CTRL+T> list files+folders in current directory (e.g., git commit <CTRL+T>,
         select a few files using <TAB>, finally <Return>)
<CTRL+R> search history of shell commands
<ALT+C> fuzzy change directory
'
# Find hidden files too (the latter is if you type "fzf" and search):
export FZF_CTRL_T_COMMAND='find . -printf "%P\\n"'
export FZF_DEFAULT_COMMAND='find .'

# WARNING: "neofetch" can cause subterminal issues with "MC" / midnight commander!
# if hostname is alien, use "pfetch" instead of "neofetch"!
#pfetch
[[ $(realpath /proc/$PPID/exe) == */bin/mc ]] || neofetch

echo '  --- Aliases or useful exports starts: ---'
echo '      alias awesomehelp=head -24  ~/.config/awesome/rc.lua'
echo '  --- Aliases or useful exports ends: ---'

