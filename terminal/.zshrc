# USER CUSTOM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home

# Source
alias srczsh="source ~/.zshrc"

# Config
alias fishrc="nvim ~/.config/fish/config.fish"
alias zshrc="nvim ~/.zshrc"
alias gitrc="nvim ~/.gitconfig"
alias tmuxrc="nvim ~/.tmux.conf"

function nvimrc {
  cd ~/.config/nvim
  nvim .
}

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
alias ej="cd ~/Developer/Java/Empty-Main"
alias er="cd ~/Developer/Rust/empty_main/"
alias lc="cd ~/Developer/Leetcode"
alias st="cd ~/Developer/Projects/Street-Fighter"

alias admin-api="cd /var/www/ethika-admin-api/"
alias admin-vue="cd /var/www/ethika-admin-vue-cli/"
alias site-api="cd /var/www/ethika-site-api/"
alias site-vue="cd /var/www/ethika-site-vue-cli/"
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

