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

# Ensure emacs keybindings (prevent plugins from switching to vi mode)
bindkey -e

# Configure autosuggestion highlight style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4c4c4c"

# Bind keys for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Add my key to the ssh agent
ssh-add -K ~/.ssh/id_rsa 2>/dev/null

# Share history between tabs
setopt inc_append_history share_history

# OS specific SCM breeze and aliases
case "$(uname)" in
  Darwin)
    alias vi=$EDITOR
    [ -s "/Users/$DEFAULT_USER/.scm_breeze/scm_breeze.sh" ] && source "/Users/$DEFAULT_USER/.scm_breeze/scm_breeze.sh"
    ;;
  Linux)
    alias vi=$EDITOR
    [ -s "/home/$DEFAULT_USER/.scm_breeze/scm_breeze.sh" ] && source "/home/$DEFAULT_USER/.scm_breeze/scm_breeze.sh"
    ;;
esac

[ -f /Users/$DEFAULT_USER/.fzf.zsh ] && source /Users/$DEFAULT_USER/.fzf.zsh

# Forter specific
alias fff="forter feature from -a"
alias ffp="forter feature pr"
alias ffc="forter feature create -n"

alias awslogin='aws --profile sso sso login'
alias awslogout='aws --profile sso sso logout'

# Use starship
eval "$(starship init zsh)"
