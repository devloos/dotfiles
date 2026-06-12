# ==========================================
# 1. INSTANT PROMPT & THEME
# ==========================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=magenta'

# ==========================================
# 2. OH MY ZSH PLUGINS & INITIALIZATION
# ==========================================
# Define custom fpaths (like Docker) BEFORE compinit runs inside Oh My Zsh
fpath=(/Users/ca/.docker/completions $fpath)

plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting zsh-z extract)

# Oh My Zsh handles compinit internally, so we don't need to call it manually over and over
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==========================================
# 3. ENVIRONMENT & PATH CLEANUP
# ==========================================
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"
export OPENSSL_ROOT_DIR="/opt/homebrew/opt/openssl@3"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home
export NODE_OPTIONS='--use-system-ca'

# Deduplicated and ordered PATH hierarchy
typeset -U path # Zsh-native trick: keeps PATH array unique, dropping duplicates automatically
path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /usr/local/go/bin
  /opt/homebrew/opt/postgresql@16/bin
  /opt/homebrew/opt/postgresql@15/bin
  /opt/homebrew/opt/bison/bin
  /opt/homebrew/opt/ruby/bin
  $HOME/.composer/vendor/bin
  $HOME/.cargo/bin
  $HOME/flutter/bin
  $path
)
export PATH

[ -f "/Users/ca/.ghcup/env" ] && . "/Users/ca/.ghcup/env"

# ==========================================
# 4. LAZY-LOAD NVM (Speed Multiplier)
# ==========================================
export NVM_DIR="$HOME/.nvm"
# Only loads NVM when you actually run 'nvm', 'node', or 'npm'
nvm() {
  unset -f nvm node npm npx
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
  nvm "$@"
}
node() { nvm > /dev/null; node "$@"; }
npm() { nvm > /dev/null; npm "$@"; }
npx() { nvm > /dev/null; npx "$@"; }

# ==========================================
# 5. ALIASES & FUNCTIONS
# ==========================================
alias cat='bat --style=plain --paging=never'
alias sz="source ~/.zshrc"
alias vim="nvim"
alias zshrc="nvim ~/.zshrc"
alias gitrc="nvim ~/.gitconfig"
alias tmuxrc="nvim ~/.tmux.conf"
alias nvimrc="nvim ~/.config/nvim"
alias nginxrc="nvim /opt/homebrew/etc/nginx"
alias l="lsd -la"
alias ls="lsd"
alias ...="cd ../.."
alias ..="cd .."
alias cbc="cb copy"

# Git
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gp='git push'
alias gu='git pull'
alias gs='git status'
alias gll='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gm='git merge'
alias gcl='git clone --recursive'
alias gi='git init'
alias gcm="git commit -m"

function get() { git checkout origin/${1} -- ${2}; }

# Tmux
alias td='tmux detach'
function ta() {
  if [ -z ${1+x} ]; then tmux attach; else tmux attach -t $1; fi
}

# Directories & Environments
alias lc="cd ~/development/leetcode"
alias andariego="cd ~/development/nexpa/el-andariego"
alias portfolio="cd ~/development/projects/portfolio"
alias costas="cd ~/development/nexpa/las-costas"
alias devlos-ui="cd ~/development/projects/devlos-ui"
alias devlos-shop="cd ~/development/projects/devlos-shop"
alias devlos-engine="cd ~/development/projects/devlos-engine"
alias tin-app="cd ~/development/tin/tin-app"
alias tin-web="cd ~/development/tin/tin-web"
alias tin-server="cd ~/development/tin/tin-maintenance"
alias tin-maintenance="cd ~/development/tin/tin-maintenance"
alias ethika="cd ~/development/ethika"
alias admin-server="cd ~/development/ethika/admin/ethika-admin-api"
alias admin-client="cd ~/development/ethika/admin/ethika-admin-vue"
alias admin-lc="cd ~/development/ethika/admin/ethika-admin-langchain"
alias site-server="cd ~/development/ethika/site/ethika-site-api"
alias site-client="cd ~/development/ethika/site/ethika-site-vue"
alias music-client="cd ~/development/ethika/music/ethika-music-nuxt"
alias common="cd ~/development/ethika/common/ethika-common"
alias pom="cd ~/development/ethika/ethika-promo"
alias nest="cd ~/development/ethika/ethika-nestjs"
alias vact="source .venv/bin/activate"
alias vdeact="source .venv/bin/deactivate"

# Docker Shortcuts
alias des="docker exec -it site-php"
alias dea="docker exec -it admin-php"

# Composables
function gx() {
  ga $1
  gcm ${2:-"update"}
  gp
}

function gxconf() {
  cp ~/Library/Application\ Support/Cursor/User/settings.json ~/development/dotfiles/cursor/settings.json
  cp ~/Library/Application\ Support/Cursor/User/keybindings.json ~/development/dotfiles/cursor/keybindings.json
  cp ~/.zshrc ~/development/dotfiles/terminal/.zshrc
  cp ~/.gitconfig ~/development/dotfiles/git/.gitconfig
  cp -r ~/.tmux.conf ~/development/dotfiles/tmux/.tmux.conf
  cp -r ~/.config/nvim ~/development/dotfiles

  local p=$(pwd)
  cd ~/development/dotfiles/ || return
  gx .
  cd $p
}

# Keybindings
bindkey '…' end-of-line
