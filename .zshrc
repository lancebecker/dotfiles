# --------------------------------------------------------------------------- 
# Options
# --------------------------------------------------------------------------- 
setopt RM_STAR_WAIT # 10 second wait to delete everything!

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
REPORTTIME=10 # print elapsed time when more than 10 seconds

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

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

# --------------------------------------------------------------------------- 
# Tmuxinator
# ---------------------------------------------------------------------------  
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
