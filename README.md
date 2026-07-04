# 🚀 Zim Zsh Configuration

This repository contains a modular Zsh configuration managed by the fast and light [Zim](https://zimfw.sh/) framework.

## 📂 Structure

- ⚙️ **[.zshrc](.zshrc)**: Shell initialization, options, keybindings, aliases, and `zimfw` bootstrap.
- 🧩 **[.zimrc](.zimrc)**: The Zim module configuration. List all plugins and themes here.

---

## 🛠️ Getting Started

### 💡 Option 1: Using ZDOTDIR (Recommended)
This approach keeps your home directory clean by keeping all Zsh config files in this directory.

1. Add the following to your `~/.zshenv` (create it if it doesn't exist):
   ```zsh
   export ZDOTDIR="/path/to/cloned/zsh-config"
   ```
2. Start a new terminal session. Zim will automatically download its files and configure itself under this folder.

### 🔗 Option 2: Symlinking to Home
If you prefer standard home directory locations:

1. Backup any existing `~/.zshrc` and `~/.zimrc`.
2. Create symlinks to the repository:
   ```bash
   ln -s /path/to/cloned/zsh-config/.zshrc ~/.zshrc
   ln -s /path/to/cloned/zsh-config/.zimrc ~/.zimrc
   ```
3. Start a new terminal session.

---

## 🔌 Managing Plugins

To customize your prompt, plugins, or completion:
1. Open 🧩 [.zimrc](.zimrc) and add/remove module lines (e.g. `zmodule user/repo`).
2. Run the update command in your shell:
   ```zsh
   zimfw install
   ```

### 💻 Handy Zim Commands
- 📥 `zimfw install`: Installs new modules and builds the initialization script.
- 🔄 `zimfw update`: Updates installed modules.
- ⬆️ `zimfw upgrade`: Upgrades the `zimfw` package manager itself.
- 🧹 `zimfw clean`: Removes unused module files.
- ⚡ `zimfw compile`: Compiles `.zsh` files to `.zwc` for faster loading.
