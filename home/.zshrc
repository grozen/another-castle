# Disable Oh My Zsh update prompt as part of Zgen
export DISABLE_AUTO_UPDATE="true"

# Load Zgen
source "${HOME}/.homesick/repos/another-castle/dependencies/zgen/zgen.zsh"

# Create Zgen init script if it doesn't exist
if ! zgen saved; then
  echo 'Creating Zgen init script...'
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/bundler

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src

  zgen oh-my-zsh themes/agnoster

  zgen save
fi

ZSH_THEME="agnoster"

DEFAULT_USER="grozen"
LANG=en_US.UTF-8

DEFAULT_RUBY="ruby-2.3.0"

# Customize the PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:$PATH

# Add Android SDK to path
export PATH=/Users/grozen/bin/android-sdk-macosx/platform-tools:/Users/grozen/bin/android-sdk-macosx/platforms:/Users/grozen/bin/android-sdk-macosx/tools:$PATH

# Add Haskell to path
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

# Set compiler aliases in OS X (assume installation through homebrew)
if [ `uname`=='Darwin' ]; then
  alias gcc='gcc-4.9'
  alias cc='gcc-4.9'
  alias g++='g++-4.9'
  alias c++='c++-4.9'
fi

# OS X specific exports
if [ `uname`=='Darwin' ]; then
  export ANDROID_HOME="/Users/grozen/android-sdk-macosx"
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Some extra aliases
alias prails='pry -r ./config/environment'

# OS specific default editor and SCM breeze
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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f /Users/grozen/.travis/travis.sh ] && source /Users/grozen/.travis/travis.sh
