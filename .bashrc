# dotfilesリポジトリの実体パスを自動検出する
# $HOME/dotfiles に決め打ちすると、マシンによって配置場所が違う場合に壊れるため、
# $HOME/.bashrc（symlink or 実体）から逆算して求める
export DOTFILES_DIR="$(cd "$(dirname "$(readlink -f "$HOME/.bashrc")")" && pwd)"

# Git に乗せたくない設定の読み込み
[ -f "$HOME/.config/bashrc_private" ] && source "$HOME/.config/bashrc_private"

# よく使うエイリアスから各コマンドのデフォルトのオプションを設定
alias n='nvim'
alias l='ls -F'
alias ls='ls -CF'
alias ll='ls -laF --show-control-chars --color=auto'
alias la='ls -A --show-control-chars --color=auto'
# 消す、移動させる場合に確認を入れる
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -p'

# WSL用、現在のフォルダを開く
alias pwdo='explorer.exe .'

# プロンプトの表示をカスタマイズする
export PS1='\[\033[01;32m\]\u\[\033[01;36m\] \w \$\[\033[00m\]'

# SSH接続先では背景色を変えて手元と区別する（OSC 11対応端末のみ、終了時に元へ戻す）
# scp等の非対話セッションで制御文字を出さないよう、対話シェルかつ端末接続時に限定する
if [ -n "$SSH_CONNECTION" ] && [[ $- == *i* ]] && [ -t 1 ]; then
  printf '\033]11;#00002a\007'
  trap 'printf "\033]111\007"' EXIT
fi

# cd系の設定
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias cdtsumugi='cd "$HOME/tsumugi"'

# git系
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'
alias gl='git log'
alias gsw='git switch'

# docker系
alias docps='docker ps'
alias docstopall='docker stop $(docker ps -q)'

# bashの設定を変えたい
alias nbash="cd \"$DOTFILES_DIR\"; nvim .bashrc"
alias nbashp="cd \"$DOTFILES_DIR\"; nvim .config/bashrc_private"
alias cddot="cd \"$DOTFILES_DIR\"; printf '\033]0;%s\007' 'dotfiles'"

# カレントディレクトリのパスをクリップボードにコピー
alias pwdc='pwd | tr -d "\n" | pbcopy'

# コマンド履歴設定
shopt -s histappend
HISTSIZE=1000000
HISTFILESIZE=1000000

# パス設定
# Neovim公式ビルド (~/.local/nvim-linux-<arch>) をaptの古いnvimより優先する
case "$(uname -m)" in
  aarch64|arm64) NVIM_ARCH=arm64 ;;
  *) NVIM_ARCH=x86_64 ;;
esac
case ":$PATH:" in
  *":$HOME/.local/nvim-linux-$NVIM_ARCH/bin:"*) ;;
  *) export PATH="$HOME/.local/nvim-linux-$NVIM_ARCH/bin:$PATH" ;;
esac
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac
case ":$PATH:" in
  *":$HOME/.bin:"*) ;;
  *) export PATH="$HOME/.bin:$PATH" ;;
esac
case ":$PATH:" in
  *":/opt/nvim-linux-$NVIM_ARCH/bin:"*) ;;
  *) export PATH="$PATH:/opt/nvim-linux-$NVIM_ARCH/bin" ;;
esac
unset NVIM_ARCH

## THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## GRAALの環境設定
export GRAALVM_HOME=/root/.sdkman/candidates/java/22.0.2-graalce/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 摩擦ジャーナル: `fj <一言>` で日時付きで ~/friction-journal.md に追記
fj() { printf '%s %s\n' "$(date '+%m-%d %H:%M')" "$*" >> ~/friction-journal.md; }

