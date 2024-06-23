# よく使うエイリアスから各コマンドのデフォルトのオプションを設定
alias l='ls'
alias ls='ls -CF'
alias ll='ls -laF --show-control-chars --color=auto'
alias la='ls -A --show-control-chars --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# プロンプトの表示をカスタマイズする
export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\]'

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

# カレントディレクトリのパスをクリップボードにコピー
alias pwdc='pwd | tr -d "\n" | pbcopy'

export PATH="$PATH:/opt/nvim-linux64/bin"

. "$HOME/.cargo/env"
