# THIS IS NEEDED FOR compdef not found
# https://stackoverflow.com/questions/66338988/complete13-command-not-found-compdef
autoload -Uz compinit
compinit

# Aliases
alias srczsh="source ~/.zshrc"

alias zshrc="nvim ~/.zshrc"
alias gitrc="nvim ~/.gitconfig"
alias tmuxrc="nvim ~/.tmux.conf"
alias nvimrc="nvim ~/.config/nvim"
alias nginxrc="nvim /opt/homebrew/etc/nginx"

alias l="ls -la"
alias ...="cd ../.."
alias ..="cd .."

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

alias lc="cd ~/development/leetcode"

alias andariego="cd ~/development/nexpa/el-andariego"
alias portfolio="cd ~/development/projects/portfolio"
alias costas="cd ~/development/nexpa/las-costas"
alias devlos-ui="cd ~/development/projects/devlos-ui"
alias devlos-shop="cd ~/development/projects/devlos-shop"
alias devlos-engine="cd ~/development/projects/devlos-engine"

alias tin="cd ~/development/tin/inked-network-app"

alias vact="source .venv/bin/activate"
alias vdeact="source .venv/bin/deactivate"

# Work
alias ethika="cd ~/development/ethika"
alias admin-server="cd ~/development/ethika/admin/ethika-admin-api"
alias admin-client="cd ~/development/ethika/admin/ethika-admin-vue"
alias site-server="cd ~/development/ethika/site/ethika-site-api"
alias site-client="cd ~/development/ethika/site/ethika-site-vue"
alias music-client="cd ~/development/ethika/music/ethika-music-nuxt"
alias common="cd ~/development/ethika/common/ethika-common"

alias des="docker exec -it site-php"
alias dea="docker exec -it admin-php"

# Composables
function ta() {
  if [ -z ${1+x} ]
  then
    tmux attach
  else
    tmux attach -t $1
  fi
}

function gx() {
  ga $1
  gcm ${2:-"update"}
  gp
}

function get() {
  git checkout origin/${1} -- ${2}
}

function gxconf() {
  cp ~/Library/Application\ Support/Code/User/settings.json ~/development/dotfiles/vscode/settings.json
  cp ~/Library/Application\ Support/Code/User/keybindings.json ~/development/dotfiles/vscode/keybindings.json
  cp ~/.zshrc ~/development/dotfiles/personal/terminal/.zshrc
  cp ~/.gitconfig ~/development/dotfiles/personal/git/.gitconfig
  cp -r ~/.tmux.conf ~/development/dotfiles/personal/tmux/.tmux.conf
  cp -r ~/.config/nvim ~/development/dotfiles

  local p=$(pwd)

  cd ~/development/dotfiles/
  gx .

  cd $p
}

# Keybindings
bindkey '…' end-of-line

# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=magenta'

plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting zsh-z extract)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# powerlevel10k

export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"
export OPENSSL_ROOT_DIR="/opt/homebrew/opt/openssl@3"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/ca/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

[ -f "/Users/ca/.ghcup/env" ] && . "/Users/ca/.ghcup/env" # ghcup-env