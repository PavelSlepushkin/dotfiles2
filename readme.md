# dotfiles

## Setup
```sh
git init --bare $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles remote add origin git@devcloud.ubs.net:slepushp/dotfiles.git
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.dotfiles git@devcloud.ubs.net:slepushp/dotfiles.git dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm --recursive my-dotfiles-tmp
```

## Configuration
```sh
dotfiles config status.showUntrackedFiles no
dotfiles remote add origin git@devcloud.ubs.net:slepushp/dotfiles.git
```

## Usage
```sh
dotfiles status
dotfiles add .gitconfig
dotfiles commit -m 'Add gitconfig'
dotfiles push
```
