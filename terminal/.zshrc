# USER CUSTOM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home
export PATH="$PATH:$HOME/.composer/vendor/bin"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Source
alias srczsh="source ~/.zshrc"

# Config
alias zshrc="nvim ~/.zshrc"
alias gitrc="nvim ~/.gitconfig"
alias tmuxrc="nvim ~/.tmux.conf"
alias nvimrc="nvim ~/.config/nvim"
alias nginxrc="nvim /opt/homebrew/etc/nginx"

# Movement
alias l="ls -la"
alias ...="cd ../.."
alias ..="cd .."

# Remaps
function ta() {
  if [ -z ${1+x} ]
  then
    tmux attach
  else
    tmux attach -t $1
  fi
}

# Git
alias ga="git add"
alias gp="git push"
alias gcm="git commit -m"
alias gti="git"
alias gom="git pull origin master"

function gx() {
  ga $1
  gcm ${2:-"update"}
  gp
}

# Folder Movement
alias ec="cd ~/Developer/CC/Empty-Main"
alias er="cd ~/Developer/Rust/empty_main/"
alias lc="cd ~/Developer/Leetcode"
alias andariego-vue="cd ~/Developer/Projects/El-Andariego/el-andariego-vue"
alias andariego-api="cd ~/Developer/Projects/El-Andariego/el-andariego-api"
alias portfolio-vue="cd ~/Developer/Projects/Portfolio/portfolio-vue"
alias portfolio-api="cd ~/Developer/Projects/Portfolio/portfolio-api"
alias psw="cd ~/Documents/Passwords/"

alias admin-api="cd /var/www/ethika-admin-api/"
alias admin-vue="cd /var/www/ethika-admin-vue-cli/"
alias site-api="cd /var/www/ethika-site-api/"
alias site-vue="cd /var/www/ethika-site-vue-cli/"
alias music-vue="cd /var/www/ethika-music-vue/"
alias music-api="cd /var/www/ethika-music-api/"
alias music-cms-vue="cd /var/www/ethika-music-cms-vue/"
alias common="cd /var/www/ethika-common/"

# Shortcuts
function gxconf() {
  cp ~/.zshrc ~/Developer/System-Config/terminal/.zshrc
  cp ~/Library/Application\ Support/Code/User/settings.json ~/Developer/System-Config/vscode/settings.json
  cp ~/.gitconfig ~/Developer/System-Config/git/.gitconfig
  cp ~/Library/Application\ Support/Code/User/keybindings.json ~/Developer/System-Config/vscode/keybindings.json
  cp -r ~/.config/nvim ~/Developer/System-Config/nvim/.config/
  cp -r ~/.tmux.conf ~/Developer/System-Config/tmux/.tmux.conf

  local p=$(pwd)

  cd ~/Developer/System-Config/
  gx .

  cd $p
}

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

export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/ca/.cargo/bin:/Users/ca/.composer/vendor/bin
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3
