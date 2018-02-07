for DOTFILE in `find ~/workspace/dotfiles/sys`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

bind -f ~/workspace/dotfiles/runcom/.inputrc


export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# added by Anaconda3 5.0.1 installer
export PATH="/anaconda3/bin:$PATH"
