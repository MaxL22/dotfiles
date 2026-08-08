# PROMPT="%{$fg_bold[yellow]%}%m%{$reset_color%} %(?:%{$fg_bold[green]%}%1{➜%}:%{$fg_bold[red]%}%1{➜%} ) %{$fg_bold[cyan]%}%~%{$reset_color%}"
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%}:%{$fg_bold[red]%}%1{➜%} ) %{$fg_bold[cyan]%}%~%{$reset_color%}"

PROMPT+=' $(git_prompt_info)%{$fg_bold[red]%}[%?] %{$fg_bold[yellow]%}$%f %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
