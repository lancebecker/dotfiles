# ZSH options {{{

    setopt auto_cd # Change dir without cd
    setopt extended_glob # Regex globbing
    setopt notify # Report the status if background jobs immediately
    setopt complete_in_word # Not just at the end
    setopt always_to_end # When complete from middle, move cursor
    setopt no_match # Show error if pattern has no matches
    setopt no_beep # Disable beeps
    setopt list_packed # Compact completion lists
    setopt list_types # Show types in completion
    setopt rec_exact # Recognize exact, ambiguous matches
    setopt hist_verify # When using ! cmds, confirm first
    setopt hist_ignore_all_dups # Ignore dups in command history
    setopt hist_ignore_space # Don't add commands prepended by whitespace to history
    setopt append_history # Allow multiple sessions to append to the history file
    setopt extended_history # Save additional info to history file
    setopt inc_append_history # Append commands to history immediately
    setopt prompt_subst # Enable variable substitution in prompt
    setopt correct # Command correction
    setopt dvorak # Correkt dvorak typing mistakes
    setopt short_loops # Allow short loops

# }}}

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

function title {
  [ "$DISABLE_AUTO_TITLE" != "true" ] || return
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}


# Use modern completion system
autoload -Uz compinit
compinit

# ls colors
autoload colors; colors;

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

PS1="%n@%m:%~%# "

zstyle ':completion:*' completer _complete _ignored _match _approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors 1 numeric
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zshcache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ":completion:*:kill:*" force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'
zstyle ':completion:*:processes' command 'ps -au$USER -o pid,time,cmd|grep -v "ps -au$USER -o pid,time,cmd"'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m-- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m-- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m-- no matches found --\e[0m'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections   true
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes


# Exports {{{

    export EDITOR="mvim -f"
    export SVN_EDITOR=vim
    export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/us/X11/bin:/usr/local/git/bin:$HOME/.rbenv/bin:$PATH:$HOME/.scripts
    export NODE_PATH="/usr/local/lib/node"
    source $HOME/.zshrc.private
    source $HOME/.dotfiles/.zsh-theme

# }}}

# Aliases {{{

    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias .....='cd ../../../..'
    alias lsa='ls -lah'
    alias l="ls -laHF"
    alias ll='ls -l'
    alias mv='nocorrect mv'       # no spelling correction on mv
    alias cp='nocorrect cp'       # no spelling correction on cp
    alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
    alias rm="nocorrect rm"
    alias o="open ."
    alias lol="cd ~/.lolcommits; open ."

    alias eap="sudo vim /private/etc/apache2/httpd.conf"
    alias apat="sudo /usr/sbin/apachectl restart"
    alias ip="ipconfig getifaddr en0"
    alias shipit="svn info | ack URL | cut -f2 -d' ' | pbcopy; cd ~/Shippable;"
    alias android="cd /usr/local/bin/android-sdk-macosx/tools/; ./android"

    sl() { svn log -l $@ } # sl 4 -> log out 4 messages
    m() { middleman server -p $@ }

    alias sml="svn log | sed -n '/lance.becker/,/----$/ p' "
    alias lc="svn log -l 1"
    alias snv="svn"

    alias gti="git"
    alias g='git'
    alias gs='git status'
    alias gl='git log'
    alias ga='git add'
    alias gc='git commit'
    alias gca='git commit -a'
    alias gco='git checkout'
    alias gm='git merge'
    alias gb='git branch'
    alias gbn='git checkout -b'
    alias gd='clear && git diff'
    alias gdm='git diff | mvim -'
    alias gll='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'

# }}}

# RBENV {{{

    eval "$(rbenv init -)"

# }}}
