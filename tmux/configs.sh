# script tmux/configs.sh
# Purpose: tmux script to load all the configs files
#!/bin/bash

# JSON array of title and path values
tmux_session="configs"
json='[
  { "title": "zshrc", "path": "~/.zshrc" },
  { "title": "tmux-", "path": "~/.config/tmux/tmux.conf" },
  { "title": "nvim","path": "~/.config/nvim/init.lua" },
  { "title": "hammerspoon", "path": "~/.hammerspoon/init.lua" },
  { "title": "kitty", "path": "~/.config/kitty/kitty.conf" },  
  { "title": "yabai", "path": "~/.config/yabai/yabairc" },
  { "title": "p10k", "path": "~/.p10k.zsh" },
  { "title": "rclone", "path": "~/.config/rclone/rclone.conf" }
]'

# for testing
# tmux kill-session -t ${tmux_session}

# Verificar si la sesión de tmux existe
if ! tmux has-session -t ${tmux_session} 2>/dev/null; then
  # Si la sesión no existe, crearla
  tmux new-session -d -s ${tmux_session}
fi

# Loop through the JSON array
echo "$json" | jq -r '.[] | .title, .path' | while read -r title && read -r path; do
  tmux new-window -n ${title} -t ${tmux_session} -d
  tmux send -t ${tmux_session}:${title} nvim SPACE ${path} ENTER
done

# Attach to the tmux session
tmux attach -t configs
