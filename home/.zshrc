# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

DEFAULT_USER="grozen"

LANG=en_US.UTF-8

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

DEFAULT_RUBY="ruby-2.1.2"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler)

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:$PATH
export PATH=/Users/grozen/bin/android-sdk-macosx/platform-tools:/Users/grozen/bin/android-sdk-macosx/platforms:/Users/grozen/bin/android-sdk-macosx/tools:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH

# Set up chruby
export PATH=/usr/local/share/chruby:$PATH
case `uname` in
  Darwin)
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    ;;
  Linux)
    source /usr/local/share/chruby/chruby.sh
    ;;
esac
chruby $DEFAULT_RUBY

source $ZSH/oh-my-zsh.sh

# Set compiler aliases in OS X (assume installation through homebrew)
if [ `uname`=='Darwin' ]; then
  alias gcc='gcc-4.9'
  alias cc='gcc-4.9'
  alias g++='g++-4.9'
  alias c++='c++-4.9'
fi

# Some extra aliases
alias prails='pry -r ./config/environment'
alias gff='nocorrect git flow feature'

case `uname` in
  Darwin)
    alias mvim='nocorrect mvim'
    export EDITOR='mvim -v'
    alias vi=$EDITOR

    [ -s "/Users/grozen/.scm_breeze/scm_breeze.sh" ] && source "/Users/grozen/.scm_breeze/scm_breeze.sh"
    ;;
  Linux)
    # Set vi as the editor
    export EDITOR='gvim -v'

    [ -s "/home/grozen/.scm_breeze/scm_breeze.sh" ] && source "/home/grozen/.scm_breeze/scm_breeze.sh"
    ;;
esac

# Postgres data folder
export PGDATA=/usr/local/var/postgres

# This lets Kred find the cracklib dictionary
export CRACKLIB_DICTPATH=/usr/local/share/cracklib-words

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export ANDROID_HOME="/Users/grozen/android-sdk-macosx"

export JAVA_HOME="/usr/libexec/java_home"
