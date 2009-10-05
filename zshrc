. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.bash/paths

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
