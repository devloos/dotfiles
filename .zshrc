# USER CUSTOM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home

# Source
alias srczsh="source ~/.zshrc"

# Config
alias fishrc="nvim ~/.config/fish/config.fish"
alias zshrc="nvim ~/.zshrc"
alias gitrc="nvim ~/.gitconfig"

# Movement
alias l="ls -la"
alias ...="cd ../.."
alias ..="cd .."

function nvimrc {
  cd ~/.config/nvim
  nvim .
}


# Git
alias ga="git add"
alias gp="git push"
alias gcm="git commit -m"
alias gti="git"

function gx() {
  local arg2="${2:-"update"}"
  ga $1
  gcm arg2
  gp
}

# Folder Movement
alias ec="cd ~/Development/CC/Empty-Main"
alias ej="cd ~/Development/Java/Empty-Main"
alias er="cd ~/Development/Rust/empty_main/"
alias lc="cd ~/Development/Leetcode"
alias tic="cd ~/Development/Projects/Java-Tic-Tac-Toe"

alias admin-api="cd /var/www/ethika-admin-api/"
alias admin-vue="cd /var/www/ethika-admin-vue-cli/"
alias site-api="cd /var/www/ethika-site-api/"
alias site-vue="cd /var/www/ethika-site-vue-cli/"
alias common="cd /var/www/ethika-common/"

# Shortcuts
function gxconf() {
  cp ~/.zshrc ~/Development/System-Config/
  cp ~/Library/Application\ Support/Code/User/settings.json ~/Development/System-Config/
  cp ~/.gitconfig ~/Development/System-Config/
  cp ~/Library/Application\ Support/Code/User/keybindings.json ~/Development/System-Config/
  cp -r ~/.config/nvim ~/Development/System-Config/.config/

  local p=$(pwd)

  cd ~/Development/System-Config/
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

