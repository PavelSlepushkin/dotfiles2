source /usr/lib/git-core/git-sh-prompt
export PS1='\e[32m\]\u@\h \[\e[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
if [ -f $HOME/.bash_aliases ]
then
  source $HOME/.bash_aliases
fi
# ssh autocomplete
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
# Path
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}
pathadd /usr/local/go/bin
pathadd $HOME/go/bin
pathadd $HOME/bin/rancher
pathadd $HOME/bin
#k8s autocomplete
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
#kubens alias
alias kubens='kubectl config set-context --current --namespace '
# Golang for ubs
export GONOPROXY=*.ubs.,*.swissbank. \
export GOPROXY=https://it4it-nexus-tp-repo.swissbank.com/repository/group-lib-golang-go-oss,direct
export GOPRIVATE=*.ubs.net,*.swissbank.com
export GOSUMDB=off
