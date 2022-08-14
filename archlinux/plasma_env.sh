#!/bin/sh

path_script_file=~/.config/plasma-workspace/env/path.sh
path_script=$(cat <<'EOF'
#!/bin/sh

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

#export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

# npm
export PATH=$PATH:$HOME/.local/bin
export NPM_CONFIG_USERCONFIG=$HOME/.config/npm/npmrc
EOF
)

echo "${path_script}" > "${path_script_file}"
chmod +x "${path_script_file}"

envs_script_file=~/.config/plasma-workspace/env/envs.sh
envs_script=$(cat <<'EOF'
#!/bin/sh

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# [gnupg]
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# [gtk-2]
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# [kde]
export KDEHOME="$XDG_CONFIG_HOME"/kde

# [zsh]
export ZDOTDIR=$HOME/.config/zsh

# [firefox]
# Run Firefox under Wayland.
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi
EOF
)

echo "${envs_script}" > "${envs_script_file}"
chmod +x "${envs_script_file}"
