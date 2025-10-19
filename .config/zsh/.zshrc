# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_THEME="powerlevel10k/powerlevel10k"
export HISTFILE="$HOME/.config/zsh/zsh_history"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://gith ub.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="gallois"
echo -ne "\e]12;#FF5C00\a"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

export ZSH_COMPDUMP="$ZSH/cache/.zcompdump"
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# Alias
alias ls='ls --indicator-style=slash --color=auto'
alias la='ls -la --indicator-style=slash --color=auto'

# Update mirrorlist
alias update_mirrorlist='sudo reflector --country Germany --latest 5 --p http --p https --sort rate --save /etc/pacman.d/mirrorlist && notify-send "Update mirror list" ""'


# Export ls colors
export LS_COLORS='di=90:fi=90:ln=90:pi=90:so=90:bd=90:cd=90:or=90'

# Zoxide
eval "$(zoxide init zsh)"

# Tmux
alias tmux_sessions='t $(zoxide query -l | fzf)'

# t-script for tmux sessions
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# Path for typst
export TYPST_ROOT="$HOME/Documents/notes"

# fzf colors
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#434d44,fg+:#5b7d5b,bg:#0F1409,bg+:#262626
  --color=hl:#689263,hl+:#86803b,info:#afaf87,marker:#5b7d5b
  --color=prompt:#5b7d5b,spinner:#5b7d5b,pointer:#5b7d5b,header:#5a4e28
  --color=border:#262626,label:#aeaeae,query:#434d44
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer=" " --separator="─" --scrollbar="│"'
