# Disable Oh My Zsh update prompt as part of Zgen
export DISABLE_AUTO_UPDATE="true"
export LDAP_USERNAME="guy.rozen"

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

export ZSH_THEME="agnoster"

export DEFAULT_USER="grozen"

export LC_ALL=en_US.UTF-8
export LC_CTYPE=UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

DEFAULT_RUBY="2.3"

# Customize the PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:$PATH

# Add Android SDK to path
export PATH=/Users/grozen/bin/android-sdk-macosx/platform-tools:/Users/grozen/bin/android-sdk-macosx/platforms:/Users/grozen/bin/android-sdk-macosx/tools:$PATH

# Add Haskell to path
export PATH=$HOME/Library/Haskell/bin:$PATH

# Set up NVM
export NVM_DIR=~/.nvm
case `uname` in
  Darwin)
    source $(brew --prefix nvm)/nvm.sh # Assuming NVM was installed using brew
    ;;
  Linux)
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    ;;
esac

# Set up chruby
case `uname` in
  Darwin)
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
    ;;
  Linux)
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
    ;;
esac
chruby $DEFAULT_RUBY

# OS X specific exports
if [ `uname`=='Darwin' ]; then
  export ANDROID_HOME="/Users/grozen/android-sdk-macosx"
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Some extra aliases
alias prails='pry -r ./config/environment'

# added by avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# OS specific default editor and SCM breeze
case `uname` in
  Darwin)
    export EDITOR='nvim'
    alias vi=$EDITOR

    [ -s "/Users/grozen/.scm_breeze/scm_breeze.sh" ] && source "/Users/grozen/.scm_breeze/scm_breeze.sh"
    ;;
  Linux)
    # Set vi as the editor
    export EDITOR='gvim -v'

    [ -s "/home/grozen/.scm_breeze/scm_breeze.sh" ] && source "/home/grozen/.scm_breeze/scm_breeze.sh"
    ;;
esac

# Add Java home bin folder to path
export PATH=$JAVA_HOME/bin:$PATH

# Postgres data folder
export PGDATA=/usr/local/var/postgres

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f /Users/grozen/.travis/travis.sh ] && source /Users/grozen/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
