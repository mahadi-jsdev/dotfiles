
A high-performance terminal development environment for CachyOS (COSMIC Desktop). This repository uses GNU Stow to manage configurations for Tmux, Neovim, and Alacritty.
📦 Requirements

    Window Manager: COSMIC (Wayland)

    Terminal: Alacritty

    Shell: Zsh/Bash

    Font: JetBrainsMono Nerd Font (Required for Tmux icons)

    Clipboard: wl-clipboard (For Neovim/Wayland sync)

🚀 Installation

    Install GNU Stow:
    Bash

sudo pacman -S stow

Clone and Link:
Bash

    git clone https://github.com/your-username/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    stow nvim
    stow tmux
    stow alacritty

🛠 Configuration Breakdown
1. Neovim (The Stow "Magic")

The Neovim setup is the most sensitive because it resides in ~/.config/nvim. To make Stow work, we mimic the path inside the repository:

Path in repo: ~/dotfiles/nvim/.config/nvim/

Symlinked to: ~/.config/nvim/

    Clipboard: Optimized for Wayland using unnamedplus.

    Performance: escape-time is set to 0 in Tmux to ensure no lag when exiting Insert Mode.

2. Tmux (The Multiplexer)

A production-ready Tmux config with a "Cool" status bar and Vim-style navigation.

    Prefix: Ctrl + a

    Navigation: Alt + h/j/k/l (Direct pane switching)

    Splits: | for vertical, - for horizontal.

    Status Bar: Features Nerd Font icons, CPU/Session info, and a transparent background to match COSMIC.

3. Alacritty

A minimalist, GPU-accelerated terminal config.

    Opacity: Set for a slight blur effect.

    Padding: Clean internal borders for a modern look.

⌨️ Keymaps Cheat Sheet
Tmux
Action	Keybind
Move Focus	Alt + h/j/k/l
New Window	Prefix + c
Split Pane	`Prefix +
Resize	Prefix + H/J/K/L
Zoom Pane	Prefix + z
Reload Config	Prefix + r
Neovim (System Sync)

    Yank to System: y (Synced via unnamedplus + wl-clipboard)

    Paste from System: p

❓ Troubleshooting

Icons not showing? Ensure your terminal font is a "Nerd Font." In CachyOS, run:

sudo pacman -S ttf-jetbrains-mono-nerd

Clipboard not working in Neovim? Ensure wl-clipboard is installed (as you are on Wayland/COSMIC):

sudo pacman -S wl-clipboard

Stow Conflicts? If a file already exists at the destination, Stow will fail. Move your existing file to a backup first:

mv ~/.tmux.conf ~/.tmux.conf.bak
