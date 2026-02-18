setopt AUTO_CD

# zim
ZIM_HOME=~/.zim

# OS固有設定の読み込み
source ~/.zshrc.$(uname | tr A-Z a-z)

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# starship
eval "$(starship init zsh)"

alias g='git'
alias d='docker'
alias dc='docker compose'
abbr -S g='git'
abbr -S d='docker'
abbr -S dc='docker compose'

# history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
