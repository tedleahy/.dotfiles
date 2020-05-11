# If you come from bash you might have to change your $PATH.
# export PATH=~/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export EDITOR='vim'

total_runtime() { echo $(bc <<< "scale=2; $(echo $(find . -maxdepth 1 -iname '*.m4v' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; | paste -sd+ -| bc)) / 60 / 60") hours }

pman() { man -Tpdf $1 | zathura - }

tt () { touch $1 && typora $1 & }

# ls after changing directory
chpwd() lsd

alias r="ranger"
alias rd="ranger ~/Downloads"
alias rdc="ranger ~/Documents"
alias rp="ranger ~/Pictures"
alias ru="ranger ~/uni"
alias rv="ranger ~/Videos"
alias rw="ranger ~/workspace"

alias cbcp="xclip -sel clip"
alias ls="lsd"
alias l="lsd -l"
alias zshf5="source ~/.zshrc"
alias open="xdg-open"
alias gsa="gnome-screenshot -a"
alias vim="vim"
alias rsyncr="rsync -r --info=progress2"
alias starts="~/config_files/sway/launch.sh"
alias t="typora"
alias pw="p wait && play ~/Music/ding.wav"
alias psb="sleep 5m && play ~/Music/ding.wav"
alias plb="sleep 15m && play ~/Music/ding.wav"
alias lock_and_suspend="i3lockmore -ef --blur 4 --lock-icon ~/.config/i3/lock.png && systemctl suspend"
alias pip_i="pip install --user"

alias cpscrshot="~/.scripts/cpscrshot"
alias gmd="~/.scripts/generate_markdown_contents"

alias yi="yay --noconfirm -S"
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

alias cfz="vim ~/.zshrc"
alias cfset="vim ~/.scripts/setup.sh"
alias cfp="vim ~/.config/polybar/config"
alias cfr="vim ~/.config/redshift/redshift.conf"
alias cfd="vim ~/Build/dwm/config.h"
alias cfv="vim ~/.vimrc"
alias cfs="vim ~/.config/sway/config"
alias cfi="vim ~/.config/i3/config"
alias cfh="vim ~/.hyper.js"

alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gs="git status"
alias gp="git push"

# Rails aliases
alias rdm="rails db:migrate"
alias rdr="rails db:rollback"

alias stepsreset="rake db:drop && rake db:create && rake db:migrate && rake db:seed && rake forms:import && rake fake:all"

alias rrg="rake routes | grep"

if which thefuck > /dev/null; then
    eval $(thefuck --alias)
fi

# Ruby gems
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="~/.rbenv/versions/$(cat ~/.rbenv/version)/bin:$PATH"
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/snap/bin:$PATH"

# opt out of .NET data collection by microsoft
export DOTNET_CLI_TELEMETRY_OPTOUT="true"

if which nodenv > /dev/null; then
  eval "$(nodenv init -)"
fi

export PATH="$HOME/.rbenv/bin:$PATH"

if which rbenv > /dev/null; then
	eval "$(rbenv init -)"
fi

export PLATFORM_TOOLS_PATH="$HOME/util/platform-tools"
if [ -d "$PLATFORM_TOOLS_PATH" ]; then
  export PATH="$PLATFORM_TOOLS_PATH:$PATH"
fi

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

