#!/usr/bin/env bash
# This Code Write by Mr.nope
# Port Scan-Ruby v1.3.0
if [[ "$(id -u)" -ne 0 ]]; then
  echo "
Please, Run This Programm as Root!"
  exit 1
fi
function main() {
    printf '\033]2;PortScan-Ruby/Installing\a'
    clear
    echo "
Installing...
"
    chmod +x portscan.rb
    sleep 2
    apt-get update
    apt-get upgrade
    apt install ruby
    echo "
Finish... :)
Usage:
      ruby portscan.rb
      "
    exit 1
}
run() {
    if [[ -d "portscan.rb" ]]; then
      git clone https://github.com/mrprogrammer2938/Portscan-Ruby
      cd Portscan-Ruby
      bash install.sh
    else
        main
    fi
}
run