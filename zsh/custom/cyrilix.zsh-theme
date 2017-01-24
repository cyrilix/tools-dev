# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status

local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

local host_color="green"
local user_color="red"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="red"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

PROMPT='%{$fg_bold[magenta]%}%T %{$fg_bold[$user_color]%}%n%{$fg_bold[yellow]%}@%{$fg_bold[$host_color]%}%m%{$reset_color%} %{$fg_bold[blue]%}%10c%{$reset_color%}%{$fg_bold[yellow]%} %# %{$reset_color%}'
#%{$fg_bold[cyan]%}❯%{$reset_color%} '

RPROMPT='$(git_super_status)'
