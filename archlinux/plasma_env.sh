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
