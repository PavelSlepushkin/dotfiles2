# Lines configured by zsh-newuser-install
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=100000
SAVEHIST=100000

# some useful options (man zshoptions)
# setopt autocd extendedglob nomatch menucomplete
# setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# The following lines were added by compinstall
zstyle :compinstall filename '/home/pavel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
_comp_options+=(globdots)
#
export PATH=/home/slepushp/.local/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/wsl/lib
#
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/vim-mode.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

#Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

#Completions
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

