# mydotfiles

> A curated set of dotfiles and configuration for a streamlined Linux (and Unix-like) workflow using i3, kitty, Alacritty, Polybar, Rofi, and more.

## 🔧 What’s included

This repository contains configuration files and modules for the following tools:

- `alacritty/` — Alacritty terminal emulator config  
- `btop/` — Configuration for the btop system monitor  
- `fastfetch/` — Lightweight system info fetcher config  
- `ghostty/` — Ghostty or related terminal multiplexer/theme config  
- `i3/` — i3 window manager configuration  
- `kitty/` — Kitty terminal emulator configuration files  
- `nvim/` — Neovim configuration (init.lua / plugins / settings)  
- `picom/` — Picom compositor configuration for shadows/fading/transparency  
- `polybar/` — Polybar status bar config  
- `rofi/` — Rofi application launcher / menu config  
- `kitty.conf`, `starship.toml`, etc — standalone config files for shell prompt and terminal  

## 🎯 Goals

- Provide a **minimal**, **efficient**, and **aesthetic** desktop environment optimized for productivity.  
- Keep all configs **version-controlled**, easy to sync across machines.  
- Use clear, modular structure so it's easy to adopt, modify or extend for your own setup.  
- Make it easier to reinstall or replicate the environment when moving to a new machine or fresh system.

## 🧱 Prerequisites

Before using these dotfiles, you’ll want to ensure your system has the required tools installed. Typical requirements include:

- Linux (any distribution, tested on Arch/Ubuntu) or other Unix-like OS  
- Window manager & compositors: i3, Picom (or equivalent)  
- Terminal emulators: Alacritty, Kitty  
- Status bar: Polybar  
- Application launcher: Rofi  
- Neovim (`nvim`) for the editor configuration  
- Optional utilities: btop, fastfetch, starship prompt  

You may also want:  
```bash
# Example (Ubuntu/Debian)
sudo apt update
sudo apt install i3 alacritty kitty polybar rofi picom neovim btop fastfetch
