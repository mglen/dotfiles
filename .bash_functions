#!/bin/bash

function gi {
    OLD_IFS="$IFS"
    IFS=':'
    INPUT=($@)
    vi +${INPUT[1]} ${INPUT[0]}
    IFS="$OLD_IFS"
}

function cheat {
  cheatfile="$HOME/cheat_$1"
  if [ ! -f "$cheatfile" ]; then
    echo "Creating $cheatfile"
    sleep 1
  fi

  if [[ -p /dev/stdout ]]; then # piped
    cat "$cheatfile"
  elif [[ ! -t 1 && ! -p /dev/stdout ]]; then # redirected
    cat "$cheatfile"
  else
    vim "$cheatfile"
  fi
}

