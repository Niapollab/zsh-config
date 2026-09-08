# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Write the history file in the ': start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Write to the history file immediately, not when the shell exits.
# Using INC_APPEND_HISTORY_TIME also records the command execution duration.
setopt INC_APPEND_HISTORY_TIME

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# History file configuration
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
# setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_BIN='/usr/share/zimfw/zimfw.zsh'
ZIM_HOME="${ZDOTDIR:-${HOME}}/.zim"

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! "${ZIM_HOME}/init.zsh" -nt "${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc}" ]]; then
  source "${ZIM_BIN}" init
fi

# Initialize modules.
source "${ZIM_HOME}/init.zsh"

# -----------------
# Theme Configuration (Moarram/headline)
# -----------------

HL_PRINT_MODE='prompt'
HL_SEP_MODE='on'
HL_ERR_MODE='detail'

# -----------------
# Utilities
# -----------------

# Alias cd to z, and cdi to zi (provided by the antoineco/zim-zoxide module)
if (( ${+commands[zoxide]} )); then
  alias cd=z
  alias cdi=zi
fi

# -----------------
# Load secret configurations
# -----------------

# Source local secret aliases or env vars if the file exists
if [[ -f "${ZDOTDIR:-${HOME}}/.zsh_secrets" ]]; then
  source "${ZDOTDIR:-${HOME}}/.zsh_secrets"
fi
