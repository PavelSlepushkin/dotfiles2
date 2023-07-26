# bindkey -e will be emacs mode
bindkey -v
export KEYTIMEOUT=1
# binds 'like-bash'
bindkey '^R' history-incremental-search-backward
bindkey -M viins '\e.' insert-last-word
# binds for autocomplete
bindkey -M viins "^[[1;5C" forward-word
bindkey -M viins "^[[1;5D" backward-word
# edit-command-line
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

