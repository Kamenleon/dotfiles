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
export PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w \$\[\033[00m\]'

# cd系の設定
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

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

# カレントディレクトリのパスをクリップボードにコピー
alias pwdc='pwd | tr -d "\n" | pbcopy'

# コマンド履歴設定
shopt -s histappend
HISTSIZE=1000000
HISTFILESIZE=1000000

# パス設定
export PATH="$PATH:/opt/nvim-linux64/bin"

## GRAALの環境設定
export GRAALVM_HOME=/root/.sdkman/candidates/java/22.0.2-graalce/

## THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/root/.deno/env"