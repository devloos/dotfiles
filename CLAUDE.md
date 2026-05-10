# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal macOS dotfiles / config snapshots. There is no install script, package manager, or symlink manager (no stow/chezmoi). Files here are **copies** of configs that live in their real locations on the system (e.g. `~/.config/nvim`, VS Code/Cursor settings, Raycast exports). Editing a file here does not affect the running system — the user manually copies between this repo and the live location.

Practical implication: when asked to "update" a config, confirm whether the user wants the change applied to the live config path as well, or only mirrored into this repo.

## Layout that needs context to navigate

- `nvim/` — actual Neovim config (lazy.nvim). Entry point is [nvim/init.lua](nvim/init.lua); plugin list lives there. LSP/formatter/exclude lists are centralized in [nvim/lua/config/constants.lua](nvim/lua/config/constants.lua) — adding a new language means editing `lsps` and/or `formatters` there, not `init.lua`. Editor options and keymaps are in [nvim/lua/config/settings.lua](nvim/lua/config/settings.lua). Leader is `<space>`.
- `scripts/cpp-setup/` — bootstraps a new C++ project in the current directory. The leading-dash files (`-cmake.sh`, `-gitignore.sh`, `-vscode.sh`, `-clang-format.sh`) are **fragments invoked by name** from [scripts/cpp-setup/cpp-setup.sh](scripts/cpp-setup/cpp-setup.sh); they each emit one config file via `echo > path`. Running `cpp-setup.sh` requires those fragment scripts to be on `PATH` (or run from this directory with `.` on `PATH`). The script also creates `include/ build/ lib/ src/ src/core/ .vscode/` and runs `cmake ..` in `build/`.
- `scripts/ytdl/dl-music` — reads `urls.txt` from cwd and downloads each line as mp3 via `youtube-dl`.
- `vscode/backup.code-profile`, `raycast/backup.rayconfig` — opaque export blobs from those apps. Treat as binary; re-export from the app rather than hand-editing.
- `cursor/{settings,keybindings}.json` — plain JSON, safe to edit.
- `browser/bookmarks_*.html` — dated bookmark exports; filename encodes the export date (m_d_yy).
- `git/`, `terminal/`, `tmux/` — currently empty placeholder directories.
- `mouseless-config.yaml` — config for the Mouseless app, lives at repo root.

## Conventions worth knowing

- No build, lint, or test commands — there is no CI and no package.json/Makefile. Don't invent one.
- The README ([readme.md](readme.md), lowercase) documents brew packages, macOS `defaults write` commands the user runs by hand, and useful one-liners. It is reference material, not an install script.
- `.gitignore` at repo root is templated for Lua/C builds (legacy from when nvim plugins were vendored here); most ignored patterns are not produced by anything currently in the repo.
