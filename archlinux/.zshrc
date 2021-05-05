#############################
### Environment variables ###
#############################

###############
### Aliases ###
###############

alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir={.git}'
alias diff='diff --color=auto'

#############
### Theme ###
#############

setopt PROMPT_SUBST
autoload -Uz colors && colors

## Main theme
function my_prompt() {
   # local PROMPT_INDICATOR="\u276f"
   local PROMPT_INDICATOR="➜"
   local PROMPT_RETURN_CLEAN="%{$fg_bold[green]%}${PROMPT_INDICATOR} "
   local PROMPT_RETURN_ERROR="%{$fg_bold[red]%}${PROMPT_INDICATOR} "
   local PROMPT_RETURN_STATUS="%(?:${PROMPT_RETURN_CLEAN}:${PROMPT_RETURN_ERROR})"
   local PROMPT_DIRECTORY="%1~"

   echo "${PROMPT_RETURN_STATUS}%{$fg[cyan]%}${PROMPT_DIRECTORY}%{$reset_color%} "
}

PROMPT="$(my_prompt)"

## VCS theme
# TODO: use git's git-prompt.sh instead... maybe?
function my_vcs_prompt() {
    local VCS_PROMPT_PREFIX="%{$fg_bold[blue]%}%s:(%{$fg[red]%}"
    local VCS_PROMPT_SUFFIX="%{$reset_color%} "
    local VCS_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
    local VCS_PROMPT_CLEAN="%{$fg[blue]%})"

    echo "${VCS_PROMPT_PREFIX}%b${VCS_PROMPT_CLEAN}${VCS_PROMPT_SUFFIX}"
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "$(my_vcs_prompt)"

precmd() {
    vcs_info
}

PROMPT+='${vcs_info_msg_0_}'

###############
### Plugins ###
###############

if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    # source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    # source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

###############
### History ###
###############

HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt HIST_IGNORE_DUPS # Ignore duplicates
setopt HIST_IGNORE_SPACE # Prevent record in history entry if preceding them with at least one space
setopt HIST_EXPIRE_DUPS_FIRST # Delete duplicate entries first if the history file needs to be trimmed
setopt SHARE_HISTORY

##################
### Completion ###
##################

autoload -Uz compinit && compinit

# Do not require a leading '.' in a filename to be matched explicitly
# setopt GLOBDOTS

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'

# Complete . and ..
zstyle ':completion:*' special-dirs true

# Autocompletion with arrow keys
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt

# Colours!
eval $(dircolors -b)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# kill autocompletion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"

# zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories # Why?

setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_MENU
unsetopt MENU_COMPLETE
unsetopt FLOWCONTROL

####################
### Key bindings ###
####################

bindkey -e

# https://wiki.archlinux.org/title/Zsh#Key_bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
