if status is-interactive
    starship init fish | source
end

# Homebrew
/opt/homebrew/bin/brew shellenv | source

# Custom $PATH
fish_add_path ~/.local/bin
