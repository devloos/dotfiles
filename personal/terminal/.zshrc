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

alias ga="git add"
alias gp="git push"
alias gcm="git commit -m"
alias gti="git"
alias gom="git pull origin master"

alias ec="cd ~/Developer/C++/Empty-Main"
alias er="cd ~/Developer/Rust/empty_main/"
alias lc="cd ~/Developer/Leetcode"
alias andariego-client="cd ~/Developer/Projects/El-Andariego/client"
alias andariego-server="cd ~/Developer/Projects/El-Andariego/server"
alias portfolio-client="cd ~/Developer/Projects/Portfolio/client"
alias portfolio-server="cd ~/Developer/Projects/Portfolio/server"
alias ml808="cd ~/Developer/Room-4D/ML808"
alias psw="cd ~/Documents/Passwords/"

alias vact="source .venv/bin/activate"
alias vdeact="source .venv/bin/deactivate"

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

function gxconf() {
  cp ~/Library/Application\ Support/Code/User/settings.json ~/Developer/dotfiles/vscode/settings.json
  cp ~/Library/Application\ Support/Code/User/keybindings.json ~/Developer/dotfiles/vscode/keybindings.json
  cp ~/.zshrc ~/Developer/dotfiles/personal/terminal/.zshrc
  cp ~/.gitconfig ~/Developer/dotfiles/personal/git/.gitconfig
  cp -r ~/.tmux.conf ~/Developer/dotfiles/personal/tmux/.tmux.conf
  cp -r ~/.config/nvim ~/Developer/dotfiles

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

export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"
export OPENSSL_ROOT_DIR="/opt/homebrew/opt/openssl@3"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home

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
