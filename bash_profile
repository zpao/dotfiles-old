source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# -- start rip config -- #
RIPDIR=/Users/pao/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #
