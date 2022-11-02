# Config
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias fishrc="nvim ~/.config/fish/config.fish"
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

function gx 
  ga $argv[1]
  gcm $argv[2]
  gp
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval $(/opt/homebrew/bin/brew shellenv)
end
