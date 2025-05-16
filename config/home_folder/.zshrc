# zmodload zsh/zprof
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="avit"

source "$HOME/.zsh_aliases"
source "$HOME/.zshenv"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
EDITOR="nvim"

chpwd() {
  ls
}

export PATH="/opt/homebrew/bin:$PATH"

# Postgres
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# Node
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Perl
PATH="/home/ted/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ted/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ted/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ted/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ted/perl5"; export PERL_MM_OPT;

export PATH="$HOME/.plenv/bin:$PATH"
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi

eval "$(rbenv init - --no-rehash zsh)"

eval "$(fzf --zsh)"

export PATH="$HOME/flutter/bin:$PATH"

# zprof

# Added by Windsurf
export PATH="/Users/tleahy/.codeium/windsurf/bin:$PATH"

# bun completions
[ -s "/Users/tleahy/.bun/_bun" ] && source "/Users/tleahy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f "/Users/tleahy/.ghcup/env" ] && . "/Users/tleahy/.ghcup/env" # ghcup-env

# Added by Windsurf
export PATH="/Users/tleahy/.codeium/windsurf/bin:$PATH"
