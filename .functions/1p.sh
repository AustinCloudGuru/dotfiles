# THIS FILE IS UNDER VERSION CONTROL.  MAKE CHANGES IN YOUR REPO!!!!! #
#*********************************************************************#
#!/usr/bin/env bash

opon() {
  if [[ -z $OP_SESSION_marsdominion ]]; then
    eval $(op signin marsdominion)
  fi
}

opoff() {
  unset OP_SESSION_marsdominion
}

sshkey() {
  opon
  echo "$(op get item "acg-master" |jq -r '.details.notesPlain')"|ssh-add -
  opoff
}

gittoken() {
  opon
  GIT_TOKEN=$(op get item "GitHub"|jq -r '.details.sections[] | select(.fields).fields[] | select(.t== "Personal Laptop").v')
  opoff
}