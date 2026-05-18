#!/usr/bin/env bash
# Idempotent bootstrap for this dotfiles repo on macOS.
# Safe to re-run: every step checks state before acting.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup"

log() { printf "\033[1;34m==>\033[0m %s\n" "$*"; }
ok()  { printf "\033[1;32m ok\033[0m %s\n" "$*"; }
warn(){ printf "\033[1;33m  !\033[0m %s\n" "$*"; }

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script targets macOS." >&2
  exit 1
fi

cat <<'EOF'

███╗   ███╗ █████╗  ██████╗    ███████╗███████╗████████╗██╗   ██╗██████╗ 
████╗ ████║██╔══██╗██╔════╝    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
██╔████╔██║███████║██║         ███████╗█████╗     ██║   ██║   ██║██████╔╝
██║╚██╔╝██║██╔══██║██║         ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
██║ ╚═╝ ██║██║  ██║╚██████╗    ███████║███████╗   ██║   ╚██████╔╝██║     
╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     

EOF

#=============================================================
# 0. Install Xcode Command Line Tools
#=============================================================
if ! command -v xcode-select >/dev/null 2>&1; then
  log "Installing Xcode Command Line Tools"
  xcode-select --install
else
  ok "Xcode Command Line Tools present"
fi

#=============================================================
# 1. Homebrew
#=============================================================
if ! command -v brew >/dev/null 2>&1; then
  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  ok "Homebrew present"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

#=============================================================
# 2. CLI formulas
#=============================================================
FORMULAS=(
  zsh
  tmux
  gh
  cmake
  lua
  luarocks
  curl
  wget
  neovim
  python
  nvm
  pnpm
  bat
  lsd
  fzf
  powerlevel10k
)
for f in "${FORMULAS[@]}"; do
  if brew list --formula "$f" >/dev/null 2>&1; then
    ok "$f"
  else
    log "brew install $f"
    brew install "$f"
  fi
done

#=============================================================
# 3. GUI apps (casks)
#=============================================================
CASKS=(
  brave-browser
  ghostty
  cursor
  discord
  docker-desktop
  mongodb-compass
  raycast
  hoppscotch
  spotify
  notion
  google-chrome
  font-meslo-lg-nerd-font
  claude-code
)
for c in "${CASKS[@]}"; do
  if brew list --cask "$c" >/dev/null 2>&1; then
    ok "$c"
  else
    log "brew install --cask $c"
    brew install --cask "$c"
  fi
done

#=============================================================
# 4. Node via nvm
#=============================================================
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
# shellcheck disable=SC1091
. "$(brew --prefix nvm)/nvm.sh"

log "Ensuring latest LTS node"
nvm install --lts >/dev/null
nvm alias default 'lts/*' >/dev/null
ok "node $(node -v)"

#=============================================================
# 5. zsh as default shell
#=============================================================
ZSH_PATH="$(brew --prefix)/bin/zsh"
if ! grep -qx "$ZSH_PATH" /etc/shells; then
  log "Registering $ZSH_PATH in /etc/shells (sudo)"
  echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
fi
if [[ "${SHELL:-}" != "$ZSH_PATH" ]]; then
  log "Setting zsh as default shell"
  chsh -s "$ZSH_PATH" || warn "chsh failed; run manually: chsh -s $ZSH_PATH"
else
  ok "zsh is default shell"
fi

#=============================================================
# 6. oh-my-zsh + plugins
#=============================================================
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  log "Installing oh-my-zsh"
  RUNZSH=no KEEP_ZSHRC=yes CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  ok "oh-my-zsh present"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
clone_plugin() {
  local url="$1" dest="$2"
  if [[ -d "$dest" ]]; then
    ok "$(basename "$dest")"
  else
    log "Cloning $(basename "$dest")"
    git clone --depth=1 "$url" "$dest"
  fi
}
clone_plugin https://github.com/zsh-users/zsh-autosuggestions     "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_plugin https://github.com/zsh-users/zsh-completions         "$ZSH_CUSTOM/plugins/zsh-completions"
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
# zsh-z and extract ship with oh-my-zsh — no clone needed

#=============================================================
# 7. tmux plugin manager
#=============================================================
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [[ -d "$TPM_DIR" ]]; then
  ok "tpm present"
else
  log "Installing tpm"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

#=============================================================
# 8. Back up existing configs (once), then copy this repo's configs into place
#=============================================================
if [[ ! -d "$BACKUP_DIR" ]]; then
  log "Backing up existing configs to $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"
  for f in "$HOME/.zshrc" "$HOME/.gitconfig" "$HOME/.tmux.conf" "$HOME/.config/nvim"; do
    [[ -e "$f" ]] && cp -R "$f" "$BACKUP_DIR/" 2>/dev/null || true
  done
fi

mkdir -p "$HOME/.config"
cp    "$DOTFILES/terminal/.zshrc"  "$HOME/.zshrc"
cp    "$DOTFILES/git/.gitconfig"   "$HOME/.gitconfig"
cp    "$DOTFILES/tmux/.tmux.conf"  "$HOME/.tmux.conf"
rm -rf "$HOME/.config/nvim"
cp -R "$DOTFILES/nvim"             "$HOME/.config/nvim"
ok "configs copied"

#=============================================================
# 9. macOS system defaults
#=============================================================
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.dock orientation -string right
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Hearing" -bool true
killall Dock 2>/dev/null || true

# Caps Lock -> Escape
hidutil property --set \
  '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}' \
  >/dev/null
ok "macOS defaults applied"

#=============================================================
# 10. Make repo scripts executable
#=============================================================
chmod +x "$DOTFILES"/scripts/cpp-setup/*.sh 2>/dev/null || true
chmod +x "$DOTFILES"/scripts/ytdl/dl-music  2>/dev/null || true

echo
ok "Setup complete."
echo
echo "Next:"
echo "  1. Restart your shell (or run: exec zsh)"
echo "  2. Open tmux and press: prefix + I   (installs tpm plugins)"
echo "  3. Raycast:  Preferences > Advanced > Import > raycast/backup.rayconfig"
echo "  4. p10k:     run 'p10k configure' if you want a fresh prompt wizard"
