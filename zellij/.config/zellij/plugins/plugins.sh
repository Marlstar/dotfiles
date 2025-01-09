# Make sure script is running in the right directory
cd /home/themarlstar/.config/zellij/plugins

rm zjstatus.wasm
wget https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm 1>/dev/null
