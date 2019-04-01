export SCRIPTS=$HOME/.scripts
export CONFIG=$HOME/.config

export GOPATH=$HOME/projects/go

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$SCRIPTS

export EDITOR=/usr/bin/nvim
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sunaku"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias en="dict -d fra-eng"
alias f=fff
alias fr="dict -d eng-fra"
alias o=xdg-open
alias sv="sudo $EDITOR"
alias t="$SCRIPTS/term.sh &"
alias td=todolist
alias v=$EDITOR
alias vi=$EDITOR
alias weather='curl -s "wttr.in/~London?0"'

# you're not in Vim ya dummy
alias :q=exit
alias :wq=exit

/usr/local/bin/philososhark
