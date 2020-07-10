export ZSH=$HOME/.oh-my-zsh
export PATH=/home/linuxbrew/.linuxbrew/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH
export PATH="$PATH:`yarn global bin`"
export DENO_INSTALL="/home/berezovyy/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64
# export TERM=xterm
export TERM='xterm-256color'
export TYPEWRITTEN_CURSOR="block"
#export TYPEWRITTEN_MULTILINE=true
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="typewritten"

plugins=(
  zsh-autosuggestions
  git
  cargo
)

source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.cargo/env

alias ys="yarn start"
alias yd="yarn dev"
alias vi="nvim"
alias cat="ccat"
alias viconf="vi ~/.config/nvim/init.vim"
alias c='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rm=gomi
alias info=zenith

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BAT_THEME="OneHalfLight"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit
alias lzd='lazydocker'
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
