export PATH=/usr/local/share/python:$PATH
export ZSH=/Users/berezovyy/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  cargo
)

source $ZSH/oh-my-zsh.sh

alias ys="yarn start"
alias yd="yarn dev"
alias vi="nvim"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(rbenv init -)"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/opt/qt/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias config='/usr/bin/git --git-dir=/Users/berezovyy/.cfg/ --work-tree=/Users/berezovyy'
