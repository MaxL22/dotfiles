# CUDA stuff (it's not working anyway)
# export PATH=/opt/cuda/bin:$PATH
# export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# MCfly config
export MCFLY_FUZZY=2
eval "$(mcfly init zsh)"

# Autostart niri
if [ -z "$WAYLAND_DISPLAY" ] && [ $(tty) = "/dev/tty1" ]; then
  exec dbus-run-session niri --session
fi

# Keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word

# Path for pipx
export PATH="$HOME/.local/bin:$PATH"

# On startup, I hope
fastfetch
