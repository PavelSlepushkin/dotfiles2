alias d='date -Idate'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias h='history'
alias k='kubectl'
alias kubens='kubectl config set-context --current --namespace '
alias vi='nvim'
alias vl='set -x ;export VAULT_ADDR="https://vault.eu.eva.ubsdev.net"; export VAULT_NAMESPACE=AT4706; vault login -method=ldap username=43479040.G; set +x'
alias vl0='set -x ;export VAULT_ADDR="https://vault.eu.eva.ubsdev.net"; export VAULT_NAMESPACE=AT41240; vault login -method=ldap username=43479040.G; set +x'
alias grep='grep --color'
alias grep1=' tee -p >(head -n1 >&2) | grep '
alias gs='git status'
alias cg='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gm='git switch $(git rev-parse --abbrev-ref origin/HEAD |cut -f2 -d\/)'
## trying some modern replacements
# alias ls=exa
# alias ll='exa -all -snew'
export LS_OPTIONS='--color=auto --classify --escape --human-readable --no-group'
alias ls="ls $LS_OPTIONS"
alias ll="ls -ltr"
alias cat=batcat
alias diff=delta
