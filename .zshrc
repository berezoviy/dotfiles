export ZSH=$HOME/.oh-my-zsh
export PATH=/home/linuxbrew/.linuxbrew/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH
export PATH="$PATH:`yarn global bin`"
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64
# export TERM=xterm
export TERM='xterm-256color'
export TYPEWRITTEN_CURSOR="block"
#export TYPEWRITTEN_MULTILINE=true
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="typewritten"


plugins=(
  git
  zsh-autosuggestions
  cargo
)

source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env

alias ys="yarn start"
alias yd="yarn dev"
alias vi="nvim"
alias cat="ccat"
alias c='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rm=gomi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
alias lzd='lazydocker'
