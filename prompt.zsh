# git status
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{247}on branch%f %B%F{208}%b%f'
autoload -Uz compinit && compinit

# prompt
# username@machine in directory on branch branchname
# % 
NEWLINE=$'\n'
PROMPT='${NEWLINE}%n@%F{125}%m%f %F{247}in%f %B%F{39}%1~%f%b ${vcs_info_msg_0_}%b ${NEWLINE}%# '
