# Aliases
alias srczsh="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias gitrc="nvim ~/.gitconfig"
alias nvimrc="nvim ~/.config/nvim"

alias l="ls -la"
alias ...="cd ../.."
alias ..="cd .."

alias ga="git add"
alias gp="git push"
alias gcm="git commit -m"
alias gti="git"
alias gom="git pull origin master"

alias admin-server="cd /var/www/ethika-admin-api/"
alias admin-client="cd /var/www/ethika-admin-vue-cli/"
alias site-server="cd /var/www/ethika-site-api/"
alias site-client="cd /var/www/ethika-site-vue-cli/"
alias music-client="cd /var/www/ethika-music-nuxt/"
alias common="cd /var/www/ethika-common/"

# Composables
function gx() {
  ga $1
  gcm ${2:-"update"}
  gp
}

function gxconf() {
  cp ~/.zshrc ~/Developer/dotfiles/work/terminal/.zshrc
  cp ~/.gitconfig ~/Developer/dotfiles/work/git/.gitconfig
  cp -r ~/.config/nvim ~/Developer/dotfiles/nvim/.config/
  cp -r ~/.tmux.conf ~/Developer/dotfiles/tmux/.tmux.conf

  local p=$(pwd)

  cd ~/Developer/dotfiles/
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
