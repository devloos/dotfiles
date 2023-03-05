# USER CUSTOM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home

# Source
alias srczsh="source ~/.zshrc"

# Config
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias fishrc="nvim ~/.config/fish/config.fish"
alias zshrc="nvim ~/.zshrc"
alias gitrc="nvim ~/.gitconfig"

# Movement
alias l="ls -la"
alias ...="cd ../.."
alias ..="cd .."

# Git
alias ga="git add"
alias gp="git push"
alias gcm="git commit -m"
alias gti="git"

function gx() {
  ga $1
  gcm $2
  gp
}

# Folder Movement
alias epm="cd ~/Development/CC/Empty-Main"
alias epmj="cd ~/Development/Java/Empty-Main"
alias lc="cd ~/Development/Leetcode"
alias tic="cd ~/Development/Projects/Java-Tic-Tac-Toe"

# Shortcuts
function gxconf() {
  cp ~/.zshrc ~/Development/System-Config/
  cp ~/Library/Application\ Support/Code/User/settings.json ~/Development/System-Config/
  cp ~/.gitconfig ~/Development/System-Config/
  cp ~/Library/Application\ Support/Code/User/keybindings.json ~/Development/System-Config/
  cp -r ~/.config/nvim ~/Development/System-Config/.config/

  local p=$(pwd)

  cd ~/Development/System-Config/
  gx . "update"

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

