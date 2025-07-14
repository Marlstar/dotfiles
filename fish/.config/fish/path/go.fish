set -x GOPATH (go env GOPATH)
set -x GOROOT (go env GOROOT)
set -x GOBIN (go env GOBIN)
fish_add_path -a $GOPATH/bin
