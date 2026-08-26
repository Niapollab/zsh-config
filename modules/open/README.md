# open

A lightweight `zimfw` utility module that defines a fallback `open` function on systems (like Linux) where `open` is not available, but `xdg-open` is.

## Behavior

- Checks if `open` is available. If not, and `xdg-open` is installed, defines the `open` function.
- Launches applications in the background using a double-fork pattern `(xdg-open "$@" &)` to completely suppress job control logs and process status updates (like `[2] + 103350 done`).
