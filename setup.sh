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
  modern-csv
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

# Only install LTS if node isn't currently available
if ! command -v node &>/dev/null; then
    nvm install --lts &>/dev/null
    nvm alias default 'lts/*' &>/dev/null
fi

ok "node $(node -v)"

#=============================================================
# 5. zsh as default shell
#=============================================================
ZSH_PATH="$(brew --prefix)/bin/zsh"
if ! grep -qx "$ZSH_PATH" /etc/shells; then
  log "Registering $ZSH_PATH in /etc/shells (sudo)"
  echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
fi

CURRENT_LOGIN_SHELL="$(dscl . -read "$HOME" UserShell 2>/dev/null | awk '{print $2}')"
if [[ "$CURRENT_LOGIN_SHELL" != "$ZSH_PATH" ]]; then
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

# ── Appearance ───────────────────────────────────────────────
# Dark mode
defaults write -g AppleInterfaceStyle -string Dark
# Only show scroll bars while scrolling
defaults write -g AppleShowScrollBars -string WhenScrolling

# ── Keyboard & typing ────────────────────────────────────────
# [had] Don't turn a double-space into a period
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
# Holding a key repeats it instead of showing the accent popup
defaults write -g ApplePressAndHoldEnabled -bool false
# Fastest key repeat (default is 6; lower = faster)
defaults write -g KeyRepeat -int 2
# Turn off continuous spell checking (red underlines)
defaults write -g NSAllowContinuousSpellChecking -bool false

# ── Trackpad & mouse ─────────────────────────────────────────
# [had] Disable two-finger swipe for back/forward
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false
# Don't enlarge the pointer when you shake it
defaults write -g CGDisableCursorLocationMagnification -bool true
# Tracking speeds
defaults write -g com.apple.trackpad.scaling -float 0.6875
defaults write -g com.apple.mouse.scaling -float 0.875
defaults write -g com.apple.scrollwheel.scaling -float 0.75

# ── Dock ─────────────────────────────────────────────────────
# [had] Dock on the right
defaults write com.apple.dock orientation -string right
# [had] Scale effect for minimizing
defaults write com.apple.dock mineffect -string scale
# [had] Auto-hide the Dock
defaults write com.apple.dock autohide -bool true
# [had] Don't show recent apps
defaults write com.apple.dock show-recents -bool false
# Small icons (default 48)
defaults write com.apple.dock tilesize -int 33
# Magnify icons on hover, up to 82
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 82
# Don't bounce apps when they open
defaults write com.apple.dock launchanim -bool false
# Minimize windows into their app icon
defaults write com.apple.dock minimize-to-application -bool true
# Bottom-right hot corner: none (default opens Quick Note)
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0

# ── Mission Control / Spaces / windows ───────────────────────
# Don't rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false
# Don't jump to a Space with open windows when switching apps
defaults write com.apple.dock workspaces-auto-swoosh -bool false
# Turn off the Space-switching slide animation (hidden setting)
defaults write com.apple.dock workspaces-swoosh-animation-off -bool true
# No gaps between tiled windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

# ── Finder ───────────────────────────────────────────────────
# Show all file extensions
defaults write -g AppleShowAllExtensions -bool true
# Column view by default
defaults write com.apple.finder FXPreferredViewStyle -string clmv
# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
# Folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
# New Finder windows open your Home folder
defaults write com.apple.finder NewWindowTarget -string PfHm
# Don't show external drives on the Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# Empty Trash items after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# ── Menu bar & Control Center ────────────────────────────────
# [had] Hide Siri in the menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false
# [had] Show the Hearing icon in the menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Hearing" -bool true
# Show battery percentage
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true
# Turn off AirPlay Receiver
defaults -currentHost write com.apple.controlcenter AirplayReceiverEnabled -bool false

# ── Screenshots ──────────────────────────────────────────────
# Save screenshots to Downloads
defaults write com.apple.screencapture location -string "$HOME/Downloads"
# Save as JPG instead of PNG
defaults write com.apple.screencapture type -string jpg
# Show mouse clicks in screen recordings
defaults write com.apple.screencapture showsClicks -bool true

# ── Power (needs sudo) ───────────────────────────────────────
# Display sleeps after 20 min on battery and power adapter
sudo pmset -a displaysleep 20
# Never sleep automatically (the display still sleeps)
sudo pmset -a sleep 0
# Don't dim the display slightly on battery
sudo pmset -b lessbright 0

# ── Apply ────────────────────────────────────────────────────
killall Dock Finder SystemUIServer ControlCenter 2>/dev/null

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
