#!/bin/bash
set -e
set -u
export TERM=xterm
# Bash Colors
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
white=`tput setaf 7`
bold=`tput bold`
reset=`tput sgr0`
separator=$(echo && printf '=%.0s' {1..100} && echo)
# Logging Function
log() {
  if [[ "$@" ]]; then echo "${bold}${green}[SSHD `date +'%T'`]${reset} $@";
  else echo; fi
}
# Generate password for root
if [ ${ROOT_PASS} == password ]; then
    ROOT_PASS=$(pwgen -c -n -1 16)
fi
echo "root:${ROOT_PASS}" | chpasswd
log "root password set to: ${white}${bold}$ROOT_PASS${reset}"

