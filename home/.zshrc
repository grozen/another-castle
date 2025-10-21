###### Install plugins via zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/bundler",   from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", as:plugin, defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

######

export DEFAULT_USER=$(whoami)

export LC_ALL=en_US.UTF-8
export LC_CTYPE=UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Configure autosuggestion highlight style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4c4c4c"

# Bind keys for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Add my key to the ssh agent
ssh-add -K ~/.ssh/id_rsa 2>/dev/null

# Share history between tabs
setopt inc_append_history share_history

# Customize the PATH
export PATH=/opt/homebrew/bin:$HOME/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/homebrew/opt/openjdk/bin:$PATH

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
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    source /opt/homebrew/opt/chruby/share/chruby/auto.sh
    ;;
  Linux)
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
    ;;
esac

# OS X specific exports
if [ `uname`=='Darwin' ]; then
  export ANDROID_HOME="/Users/$DEFAULT_USER/android-sdk-macosx"
  export JAVA_HOME="/opt/homebrew/opt/openjdk/bin"
  export GOPATH="/Users/$DEFAULT_USER/go"
  export PATH=$PATH:$GOPATH/bin # Add gopath to path
fi

# OS specific default editor and SCM breeze
case `uname` in
  Darwin)
    export EDITOR='nvim'
    alias vi=$EDITOR

    [ -s "/Users/$DEFAULT_USER/.scm_breeze/scm_breeze.sh" ] && source "/Users/$DEFAULT_USER/.scm_breeze/scm_breeze.sh"
    ;;
  Linux)
    # Set vi as the editor
    export EDITOR='gvim -v'

    [ -s "/home/$DEFAULT_USER/.scm_breeze/scm_breeze.sh" ] && source "/home/$DEFAULT_USER/.scm_breeze/scm_breeze.sh"
    ;;
esac

# Add Java home bin folder to path
export PATH=$JAVA_HOME/bin:$PATH

# Postgres data folder
export PGDATA=/usr/local/var/postgres

[ -f /Users/$DEFAULT_USER/.fzf.zsh ] && source /Users/$DEFAULT_USER/.fzf.zsh

# Forter specific
alias fff="forter feature from -a"
alias ffp="forter feature pr"
alias ffc="forter feature create -n"

export AWS_PROFILE="main-wrapped"
export AWS_SDK_LOAD_CONFIG=1
alias awslogin='aws --profile sso sso login'
alias awslogout='aws --profile sso sso logout'

# Init pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Configure poetry
export POETRY_VIRTUALENVS_CREATE=true
export POETRY_PACKAGE_MODE=false
export POETRY_REPOSITORIES_FORTER_URL="https://artifactory.frdstr.com/artifactory/api/pypi/pypi/simple"

# Use starship
eval "$(starship init zsh)"
