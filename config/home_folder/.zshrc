if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export TERM=xterm-256color # Make colors work in vim + tmux
export EDITOR="nvim"

## Plugins
# Fish-like autocomplete
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ls after changing directory
chpwd() ls

# Configure the prompt
# Load version control information
autoload -Uz vcs_info
precmd() {
    vcs_info
    # Format the vcs_info_msg_0_ variable
    setopt PROMPT_SUBST
    zstyle ':vcs_info:git:*' formats ' %b %u'

    username='%F{172}%n%f'
    cwd='%F{40}%~/%f'
    prompt_char='%F{200}$%f'
    git_info="%F{74}${vcs_info_msg_0_}%f"
    NEWLINE=$'\n'

    PROMPT='${username} ${cwd} ${git_info}${NEWLINE}${prompt_char} '
}

# NVM:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Plenv:
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init - zsh)"
