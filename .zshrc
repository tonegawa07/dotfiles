setopt AUTO_CD

# zim
ZIM_HOME=~/.zim

# OS固有設定の読み込み
source ~/.zshrc.$(uname | tr A-Z a-z)

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# starship
eval "$(starship init zsh)"

# ndir
eval "$(ndir --init)"

alias g='git'
alias d='docker'
alias dc='docker compose'
alias nd='ndir'
alias ghop='githop'
abbr -S -q g='git'
abbr -S -q d='docker'
abbr -S -q dc='docker compose'
abbr -S -q nd='ndir'
abbr -S -q ghop='githop'

# ghq + fzf
function gf() {
    local dir=$(ghq list -p | fzf)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# bun completions
[ -s "/Users/starx117/.bun/_bun" ] && source "/Users/starx117/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
