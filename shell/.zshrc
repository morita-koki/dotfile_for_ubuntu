autoload -Uz compinit && compinit


setopt share_history
setopt no_beep
setopt auto_cd
# setopt correct
setopt hist_reduce_blanks
setopt hist_ignore_all_dups


source ~/zinit
source ~/env
source ~/aliases
source ~/paths
source ~/prompt


# メモリに保存
export HISTSIZE=1000

# 履歴ファイルに保存
export SAVEHIST=100000


# set start directory 
# WS_DIR=$HOME/workspace
# cd $WS_DIR



export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


