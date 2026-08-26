# 🚀 Zim Zsh Configuration

This repository contains a modular Zsh configuration managed by the fast and light [Zim](https://zimfw.sh/) framework.

## 📂 Structure

- ⚙️ **[.zshrc](.zshrc)**: Shell initialization, options, keybindings, aliases, and `zimfw` bootstrap.
- 🧩 **[.zimrc](.zimrc)**: The Zim module configuration. List all plugins and themes here.
- 🔒 **`.zsh_secrets`**: Local secret aliases, API tokens, and environment variables (ignored by Git).

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

## 🔒 Local Secrets

For storing sensitive information (such as API tokens, private aliases, or environment variables) that you do not want to commit to Git:

1. Create the secrets file:
   ```bash
   touch .zsh_secrets
   ```
2. Restrict its permissions so only you can read it:
   ```bash
   chmod 600 .zsh_secrets
   ```
3. Add your private configurations inside `.zsh_secrets` (e.g., `export API_KEY="..."` or `alias private_db="..."`).

---

## 🔌 Managing Plugins

To customize your prompt, plugins, or completion:
1. Open 🧩 [.zimrc](.zimrc) and add/remove module lines (e.g. `zmodule user/repo`).
2. Run the update command in your shell:
   ```zsh
   zimfw install
   ```


### 🧩 Custom Local Modules

For custom functions, utility scripts, or configurations that you want to write yourself and compile with `zimfw`:

1. Create a directory inside `modules/` (e.g., `modules/my-helper/`).
2. Add an `init.zsh` script inside that directory containing your functions or settings.
3. Register the local module in [`.zimrc`](.zimrc) using the absolute path relative to `$ZDOTDIR`:
   ```zsh
   zmodule "${ZDOTDIR:-${HOME}}/modules/my-helper"
   ```
4. Run the compilation command:
   ```zsh
   zimfw compile
   ```

### 💻 Handy Zim Commands
- 📥 `zimfw install`: Installs new modules and builds the initialization script.
- 🔄 `zimfw update`: Updates installed modules.
- ⬆️ `zimfw upgrade`: Upgrades the `zimfw` package manager itself.
- 🧹 `zimfw clean`: Removes unused module files.
- ⚡ `zimfw compile`: Compiles `.zsh` files to `.zwc` for faster loading.
