export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/projects/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.scripts
export EDITOR=/usr/bin/nvim

ZSH_THEME="sunaku"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias vi=nvim
alias v=nvim
alias sv='sudo nvim'
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias weather='curl -s "wttr.in/~London?0"'
alias todo=todolist

# you're not in Vim ya dummy
alias :q=exit
alias :wq=exit

/usr/local/bin/philososhark
