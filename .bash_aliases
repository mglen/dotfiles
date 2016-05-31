#!/usr/bin/env bash

alias l='ls -CF'
alias ll='ls -alF'

# Quick password generation
alias apgg='apg -n 16 -m 12 -x 16 -M NCL'

# Because I do this too much
alias grpe='grep'

# Git aliases:
alias gits='git status'

# For pass
alias gpg-get="export GPG_AGENT_INFO=$(echo $(ls /tmp/gpg-*/S.gpg-agent):6942:1)"
