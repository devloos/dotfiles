# USER CUSTOM
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home
export PATH="/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/ca/.cargo/bin:/Users/ca/.composer/vendor/bin:/opt/homebrew/opt/bison/bin:$PATH"

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
alias ec="cd ~/Developer/C++/Empty-Main"
alias er="cd ~/Developer/Rust/empty_main/"
alias lc="cd ~/Developer/Leetcode"
alias andariego-vue="cd ~/Developer/Projects/El-Andariego/client"
alias andariego-api="cd ~/Developer/Projects/El-Andariego/server"
alias portfolio-vue="cd ~/Developer/Projects/Portfolio/client"
alias portfolio-api="cd ~/Developer/Projects/Portfolio/server"
alias ml808="cd ~/Developer/Room-4D/ML808"
alias psw="cd ~/Documents/Passwords/"

alias admin-api="cd /var/www/ethika-admin-api/"
alias admin-vue="cd /var/www/ethika-admin-vue-cli/"
alias site-api="cd /var/www/ethika-site-api/"
alias site-vue="cd /var/www/ethika-site-vue-cli/"
alias music-vue="cd /var/www/ethika-music-vue/"
alias music-api="cd /var/www/ethika-music-api/"
alias music-cms-vue="cd /var/www/ethika-music-cms-vue/"
alias common="cd /var/www/ethika-common/"

# Python
alias vact="source .venv/bin/activate"
alias vdeact="source .venv/bin/deactivate"

# Shortcuts
function gxconf() {
  cp ~/.zshrc ~/Developer/dotfiles/terminal/.zshrc
  cp ~/Library/Application\ Support/Code/User/settings.json ~/Developer/dotfiles/vscode/settings.json
  cp ~/.gitconfig ~/Developer/dotfiles/git/.gitconfig
  cp ~/Library/Application\ Support/Code/User/keybindings.json ~/Developer/dotfiles/vscode/keybindings.json
  cp -r ~/.config/nvim ~/Developer/dotfiles/nvim/.config/
  cp -r ~/.tmux.conf ~/Developer/dotfiles/tmux/.tmux.conf
  cp -r ~/.warp/themes ~/Developer/dotfiles/terminal

  local p=$(pwd)

  cd ~/Developer/dotfiles/
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

export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ca/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ca/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ca/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ca/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

