#!/bin/zsh

# Auto-completion
autoload -U compinit
compinit

zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Don't show already selected elements
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps -aU$USER'
# Completion Styles
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle :compinstall filename "$HOME/.zshrc"

# Correction
setopt correctall

# Colors
autoload -U colors
colors

setopt transient_rprompt # remove the RPS1 after hit enter
export PS1="%n%B@%b%m %{$fg[red]%}%~ %{$reset_color%}%% "

# Historic
setopt hist_ignore_all_dups # Don't have duplication in history
export HISTSIZE=2000
export HISTFILE="$HOME/.zhistory"
export SAVEHIST=$HISTSIZE

# Dynamic right prompt with the hour
function precmd	{
  export RPS1="[%{$fg[black]%}%B%*%b%{$reset_color%}]" 
}

# Usefull aliases
alias ls='ls --color=auto'
alias nano='nano -w'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ebuild-mainfest='FEATURES="-mini-manifest" ebuild'
alias halt='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop'
alias reboot='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart'

# Bind keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
