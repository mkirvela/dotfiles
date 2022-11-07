local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

function aws_part {
  local profile="${AWS_PROFILE:-${AWS_DEFAULT_PROFILE}}"

  if [[ -z "${profile}" ]]
  then echo ""
  else echo "[%{$FG[248]%}aws%{$reset_color%}:%{$fg[yellow]%}${profile}%{$reset_color%}] "
  fi
}

PROMPT='${ret_status} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)$(aws_part)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
