#!/usr/bin/env zsh
if [[ $UID != 0 ]] && which keychain >/dev/null && [[ -d ~/.keychain ]]; then
    keychain --nogui --ignore-missing id_rsa
fi
