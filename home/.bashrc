DEFAULT_USER="guy_rozen"

[ -s "/Users/$DEFAULT_USER/.scm_breeze/scm_breeze.sh" ] && source "/Users/$DEFAULT_USER/.scm_breeze/scm_breeze.sh"

# added by travis gem
[ -f /Users/$DEFAULT_USER/.travis/travis.sh ] && source /Users/$DEFAULT_USER/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
