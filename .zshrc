ZSH=$HOME/.oh-my-zsh
ZSH_THEME="becker"
export UPDATE_ZSH_DAYS=30
COMPLETION_WAITING_DOTS="true"

plugins=(git osx svn colorize coffee node npm)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.private
export PATH=/usr/bin:/usr/local/bin:/usr/local/git/bin:$HOME/.rbenv/bin:$PATH:$HOME/.scripts
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a iTerm"'

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
alias bex="bundle exec"
alias eap="sudo vim /private/etc/apache2/httpd.conf"
alias apat="sudo /usr/sbin/apachectl restart"
alias ip="ipconfig getifaddr en0"
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
alias sdiff="svn diff -rPREV | mvim -"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

