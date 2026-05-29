# 0x113.zsh-theme
# Author: 0x113 <hello@sebastianglab.com>
# License: MIT
# Description: A Zsh theme for Kubernetes users based on the Fox theme.
kube_prompt_info() {
  local ctx
  ctx="$(kubectl config current-context 2>/dev/null)"

  [[ -n "$ctx" ]] || return

  printf '[k8s:%s]-' "$ctx"
}

PROMPT='%{$fg[cyan]%}┌$(kube_prompt_info)[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$fg_bold[white]%}%M%{$reset_color%}%{$fg[cyan]%}]%{$fg[white]%}-%{$fg[cyan]%}(%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[cyan]%})$(git_prompt_info)
└> % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="-[%{$reset_color%}%{$fg[white]%}git://%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[cyan]%}]-"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
