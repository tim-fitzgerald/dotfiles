if command -v dev &>/dev/null; then
  eval "$(dev _hook)"
fi

export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export PATH=$PATH:/usr/local/go/bin

alias gam="/Users/timfitzgerald1/bin/gamadv-xtd3/gam"