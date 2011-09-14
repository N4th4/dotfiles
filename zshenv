#!/usr/bin/env zsh
if [[ $UID != 0 ]] && which keychain >/dev/null && [[ -d ~/.keychain ]]; then
    keychain --nogui --noask --quiet
    if [[ -f ~/.keychain/`hostname`-sh ]]; then
        . ~/.keychain/`hostname`-sh
    fi
fi
