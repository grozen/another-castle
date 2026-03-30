export DEFAULT_USER=$(whoami)

export LC_ALL=en_US.UTF-8
export LC_CTYPE=UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Customize the PATH
export PATH=/opt/homebrew/bin:$HOME/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/homebrew/opt/openjdk/bin:$PATH

# OS X specific exports
if [ "$(uname)" = "Darwin" ]; then
  export ANDROID_HOME="/Users/$DEFAULT_USER/android-sdk-macosx"
  export JAVA_HOME="/opt/homebrew/opt/openjdk"
  export GOPATH="/Users/$DEFAULT_USER/go"
  export PATH=$PATH:$GOPATH/bin
fi

# Add Java home bin folder to path
export PATH=$JAVA_HOME/bin:$PATH

# OS specific editor
case "$(uname)" in
  Darwin)
    export EDITOR='nvim'
    ;;
  Linux)
    export EDITOR='gvim -v'
    ;;
esac

# Postgres data folder
export PGDATA=/usr/local/var/postgres

export AWS_PROFILE="main-wrapped"
export AWS_SDK_LOAD_CONFIG=1

export POETRY_VIRTUALENVS_CREATE=true
export POETRY_PACKAGE_MODE=false
export POETRY_REPOSITORIES_FORTER_URL="https://artifactory.frdstr.com/artifactory/api/pypi/pypi/simple"

# Init mise (Python and other runtimes)
eval "$(mise activate zsh --shims)"

# Stubs for scm_breeze functions, used by some tools in non-interactive shells
token_quote() {
  local quoted
  quoted=()
  for token
  do
    quoted+=("$(printf '%q' "$token")")
  done
  printf '%s\n' "${quoted[*]}"
}

_safe_eval() {
  eval $(token_quote "$@")
}

# Add "gbk" command for deleting all branches except the specified one
gbk() {
  git branch --no-color | grep -v "$1" | xargs git branch -D
}
