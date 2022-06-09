export PS1='\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
if [ -f $HOME/.bash_aliases ]
then
  source $HOME/.bash_aliases
fi

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}
pathadd $HOME/bin
pathadd $HOME/bin/rancher
#curl ssl fix
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-bundle.crt
#k8s autocomplete
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
