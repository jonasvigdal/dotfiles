# Exports
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Download Zinit Plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Load completions
autoload -U compinit && compinit

# Add plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice lucid wait'0'; zinit light joshskidmore/zsh-fzf-history-search
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Keybindings
bindkey -e
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^R' fzf-history-search

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Aliases
alias ls='ls --color'

# Git Aliases
alias -g logpr='log --oneline -n 10'
alias -g reflogpr='reflog --oneline -n 10'
alias -g co='checkout'
alias -g coc='checkout -b'
alias -g rob='~/autostore/Robot8_monorepo'

# Shell integrations
#eval "$(fzf --zsh)"

# Set flags for SSH key
source /home/jonas/toolchains/add_paths.sh

#eval $(ssh-agent) >/dev/null 2>!1
#ssh-add ~/.ssh/id_ed25519 >/dev/null 2>!1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 


#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

