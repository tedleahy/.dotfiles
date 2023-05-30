if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export TERM=xterm-256color # Make colors work in vim + tmux
export EDITOR="nvim"

## Plugins
# Fish-like autocomplete
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ls after changing directory
chpwd() lsd

# Configure the prompt
source ~/.git-prompt.sh # provides the __git_ps1 command

username="%F{200}%n%f"
cwd="%F{40}%~/%f"
prompt_char="%F{200}🌵%f"
git="%F{160}$(__git_ps1)%f"
NEWLINE=$'\n'

PROMPT="${username} ${cwd}${git}${NEWLINE}${prompt_char} "
