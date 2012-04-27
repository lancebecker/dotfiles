function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '☠'
}

PROMPT="%{$fg_bold[red]%} $(virtualenv_info)$(prompt_char) %{$fg_bold[yellow]%} %~ "
RPROMPT=""
