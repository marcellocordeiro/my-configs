#!/bin/sh

ssh_add_autostart_file=~/.config/autostart/ssh-add.desktop
ssh_add_autostart=$(cat <<'EOF'
[Desktop Entry]
Exec=ssh-add -q ~/.ssh/id_ed25519
Name=ssh-add
Type=Application
EOF
)

ssh_env_script_file=~/.config/plasma-workspace/env/ssh-env.sh
ssh_env_script=$(cat <<'EOF'
#!/bin/sh

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_ASKPASS='/usr/bin/ksshaskpass'
EOF
)

echo "${ssh_add_autostart}" > "${ssh_add_autostart_file}"
echo "${ssh_env_script}" > "${ssh_env_script_file}"

chmod +x "${ssh_env_script_file}"

# ssh-agent service
ssh_agent_start_service_file=~/.config/systemd/user/ssh-agent.service
ssh_agent_start_service=$(cat <<'EOF'
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# DISPLAY required for ssh-askpass to work
Environment=DISPLAY=:0
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
EOF
)

mkdir -p ~/.config/systemd/user
echo "${ssh_agent_start_service}" > "${ssh_agent_start_service_file}"
systemctl enable --user ssh-agent.service
