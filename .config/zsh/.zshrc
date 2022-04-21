## -- zplug settings --
export ZPLUG_HOME=$ZDOTDIR/.zplug

if [ ! -d $ZPLUG_HOME ]; then
  echo "install zplug..."
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "chrissicool/zsh-256color"

zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "zdharma-continuum/history-search-multi-word"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

## -- zplug settings --

## -- asdf settings --

export ASDF_DIR=$HOME/.config/asdf

if [ ! -d $ASDF_DIR ]; then
  git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.9.0
fi

. $ASDF_DIR/asdf.sh

fpath=(${ASDF_DIR}/completions $fpath)

## -- asdf settings --

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/exports.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
