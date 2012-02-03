# ---------------------------------------------------------------------------
# Options                                                                   -
# ---------------------------------------------------------------------------
setopt auto_cd # instead of cd dirname, dirname will do just fine
setopt rm_star_wait # 10 second wait to delete everything!
setopt share_history # Share history between shells
setopt autolist
unsetopt menucomplete

# ---------------------------------------------------------------------------
# Exports                                                                   -
# ---------------------------------------------------------------------------
export EDITOR=vim
export SVN_EDITOR=vim  
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/us/X11/bin:/usr/local/git/bin:$HOME/.rbenv/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="fino"
export NODE_PATH="/usr/local/lib/node"
source $ZSH/oh-my-zsh.sh
source $HOME/.private-zshrc

# ---------------------------------------------------------------------------
# Aliases                                                                   -
# ---------------------------------------------------------------------------
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias mvim="~/.scripts/mvim"
alias yuicompress="echo \"Changing to YUICompressor directory\"; cd ~/Tools/YUICompressor/build; echo \"Usage: java -jar yuicompressor-x.y.z.jar [input file] -o [output file]\""
alias o="open ."
alias reload=". ~/.zshrc"
alias eap="sudo vim /private/etc/apache2/httpd.conf"
alias apacherestart="sudo /usr/sbin/apachectl restart"
alias ip="ipconfig getifaddr en0"
alias shipit="svn info | ack URL | cut -f2 -d' ' | pbcopy; cd ~/Shippable;"

# RUBY ///////////
alias be="bundle exec"

# SVN ////////////
alias sl="svn log | sed -n '/lance.becker/,/----$/ p' "
alias lc="svn log -l 1"

# GIT ////////////
alias g='git'    
alias gs='git status'
alias gl='git log'
alias ga='git add .'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gm='git merge'
alias gb='git branch'
alias gbn='git checkout -b'
alias gd='clear && git diff'
alias gdm='git diff | mate'       
alias gll='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
# 

# ---------------------------------------------------------------------------
# RBENV 
# ---------------------------------------------------------------------------
eval "$(rbenv init -)"

