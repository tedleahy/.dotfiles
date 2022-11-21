# Enable auto-completion definitions (e.g. by git plugin)
autoload -Uz compinit
compinit

# Plugins #
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Use the oh-my-zsh git plugin without oh-my-zsh
ZSH=~/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom
source $ZSH/lib/git.zsh
source $ZSH/plugins/git/git.plugin.zsh
# alias overrides
alias gs="git status"
alias gst="git stash"

source ~/.zsh/fzf-functions.zsh

autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Appearance #
NEWLINE=$'\n'
setopt PROMPT_SUBST
PROMPT=$'%F{#FF0080}${PWD/#$HOME/~}%f %F{#5abce6}\UE0A0 ${vcs_info_msg_0_}%f ${NEWLINE}🐙 '

export EDITOR='nvim'

total_runtime() { echo $(bc <<< "scale=2; $(echo $(find . -maxdepth 1 -iname '*.m4v' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; | paste -sd+ -| bc)) / 60 / 60") hours }

function mkdircd() {
  mkdir $1 && cd $1
}

# ls after changing directory
chpwd() lsd

alias cdmf="cd ~/projects/messagefocus"

alias r="ranger"
alias rd="ranger ~/Downloads"
alias rdc="ranger ~/Documents"
alias rp="ranger ~/Pictures"
alias ru="ranger ~/uni"
alias rv="ranger ~/Videos"
alias rw="ranger ~/workspace"

alias cbcp="xclip -sel clip"
alias zr="source ~/.zshrc"
alias gsa="gnome-screenshot -a"
alias rsyncr="rsync -r --info=progress2"
alias t="typora"
alias pw="p wait && play ~/Music/ding.wav"
alias psb="sleep 5m && play ~/Music/ding.wav"
alias plb="sleep 15m && play ~/Music/ding.wav"
alias lock_and_suspend="i3lockmore -ef --blur 4 --lock-icon ~/.config/i3/lock.png && systemctl suspend"
alias tn="tmux new"
alias ta="tmux attach"

alias cpscrshot="~/.scripts/cpscrshot"
alias gmd="~/.scripts/generate_markdown_contents"

alias yi="yay --noconfirm --needed -S"
alias yr="yay -R"
alias ys="yay -Ss"
alias yqs="yay -Qs"
alias yup="yay --noconfirm -Syyu && yay --noconfirm -Syyua"

alias ai="sudo apt install -y"
alias dpkgi="sudo dpkg -i"
alias ar="sudo apt purge"
alias as="apt-cache search"
alias aqs="dpkg -l | grep"
alias aup="sudo apt update && sudo apt upgrade"

alias cfz="nvim ~/.zshrc"
alias cfset="nvim ~/.scripts/setup.sh"
alias cfp="nvim ~/.config/polybar/config"
alias cfr="nvim ~/.config/redshift/redshift.conf"
alias cfd="nvim ~/Build/dwm/config.h"
alias cfv="nvim ~/.config/nvim/init.vim"
alias cfvp="nvim ~/.config/nvim/vim-plug/plugins.vim"
alias cfvs="nvim ~/.config/nvim/general/settings.vim"
alias cfvk="nvim ~/.config/nvim/keys/mappings.vim"
alias cfi="nvim ~/.config/i3/config"

# Rails aliases
alias rdm="rails db:migrate"
alias rdr="rails db:rollback"
alias rrg="rails routes | grep"

# Docker aliases
alias dc="docker compose"
alias dcb="dc build"
alias dcu="dc up"
alias dcub="dcu --build"
alias dcr="dc run"
alias dcrbe="dcr backend"

if which thefuck > /dev/null; then
    eval $(thefuck --alias)
fi

# Add .scripts directory (for personal scripts) to PATH
export PATH="$HOME/.scripts:$PATH"

export PATH="/sbin:$PATH"
export PATH="/snap/bin:$PATH"

# opt out of .NET data collection by microsoft
export DOTNET_CLI_TELEMETRY_OPTOUT="true"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PLATFORM_TOOLS_PATH="$HOME/util/platform-tools"
if [ -d "$PLATFORM_TOOLS_PATH" ]; then
  export PATH="$PLATFORM_TOOLS_PATH:$PATH"
fi

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

# Don't run homebrew update every time you install a package
export HOMEBREW_NO_AUTO_UPDATE=1

# For stack
export PATH="$HOME/.local/bin:$PATH"

##    ##
# Perl #
##    ##
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init - zsh)"

# Flutter
export PATH="$PATH:/opt/flutter/bin"

if [ -e /Users/tleahy/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/tleahy/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# alias s="rsync -ruv --exclude={'local','vendor','node_modules','package.json'} --links /Users/tleahy/projects/messagefocus/* ted.leahy@10.154.171.41:/home/ted.leahy/messagefocus"
alias s="rsync -ruv --exclude={'local','vendor','node_modules','package.json'} --links ./* ted.leahy@10.154.171.41:/home/ted.leahy/messagefocus"

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

[ -f "/Users/tleahy/.ghcup/env" ] && source "/Users/tleahy/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

################
# Ruby/Rails #
################
eval "$(rbenv init -)"

alias rspec="bin/rspec"
alias rails="bin/rails"
