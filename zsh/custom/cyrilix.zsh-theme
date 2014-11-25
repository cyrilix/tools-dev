# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status

local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

local host_color="green"
local user_color="red"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="red"
fi

PROMPT='%{$fg_bold[magenta]%}%T %{$fg_bold[$user_color]%}%n%{$fg_bold[yellow]%}@%{$fg_bold[$host_color]%}%m%{$reset_color%} %{$fg_bold[blue]%}%10c%{$reset_color%}$(git_prompt_info)$(git_remote_status)%{$fg_bold[yellow]%} %# %{$reset_color%}'
#%{$fg_bold[cyan]%}❯%{$reset_color%} '


RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}(%{$reset_color%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}) %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%} ↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%} ↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%} ↕%{$reset_color%}"

