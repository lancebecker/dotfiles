# --------------------------------------------------------------------------- 
# Options
# --------------------------------------------------------------------------- 
setopt auto_cd # instead of cd dirname, dirname will do just fine
setopt rm_star_wait # 10 second wait to delete everything!
setopt share_history # Share history between shells
setopt autolist
unsetopt menucomplete

# --------------------------------------------------------------------------- 
# Exports
# --------------------------------------------------------------------------- 
export EDITOR=vim
export SVN_EDITOR=vim  
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/us/X11/bin:/usr/local/git/bin:/usr/local/share/npm/bin
export NODE_PATH="/usr/local/lib/node"
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="lrbecker"
export DISABLE_LS_COLORS="true"
plugins=(osx git ruby)
source $ZSH/oh-my-zsh.sh

# --------------------------------------------------------------------------- 
# Aliases
# --------------------------------------------------------------------------- 
alias mvim="~/.scripts/mvim"
alias oo="mvim; open ."
alias o="open ."

# --------------------------------------------------------------------------- 
# ZStyles
# ---------------------------------------------------------------------------  
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' verbose no
zstyle ':completion:*:cd:*' ignore-parents parent pwd       
