export CLICOLOR="YES"
export TERM=xterm-color
export EDITOR="vim"
export LSCOLORS=ExFxCxDxBxegedabagacad

export PATH=$HOME/.bin:$HOME/.dotfiles/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# 37signals
export RUBY_HEAP_MIN_SLOTS=600000
export RUBY_GC_MALLOC_LIMIT=59000000
export RUBY_HEAP_FREE_MIN=100000

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
