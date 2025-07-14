set -x GOPATH (go env GOPATH)
set -x GOROOT (go env GOROOT)
set -x GOBIN (go env GOBIN)
set -x PATH $PATH $GOPATH/bin
