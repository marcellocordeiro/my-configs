#!/bin/sh

set -e

# ssh-env
ssh_env_src="./files/ssh-env.sh"
ssh_env_dest="$HOME/.config/plasma-workspace/env/ssh-env.sh"

mkdir -p $(dirname "$ssh_env_dest")
cp $ssh_env_src $ssh_env_dest
chmod +x $ssh_env_dest

# ssh-agent service
ssh_agent_service_src="./files/ssh-agent.service"
ssh_agent_service_dest="$HOME/.config/systemd/user/ssh-agent.service"

mkdir -p $(dirname "$ssh_agent_service_dest")
cp $ssh_agent_service_src  $ssh_agent_service_dest

systemctl enable --user ssh-agent.service

# ssh config
ssh_config_src="./files/ssh-config"
ssh_config_dest="$HOME/.ssh/config"

mkdir -p $(dirname "$ssh_config_dest")
cp $ssh_config_src $ssh_config_dest
