# Explicitly configured $PATH variable
PATH=$PATH:~/dotfiles/bin

DOTFILES=~/dotfiles                    # dotfiles directory
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="avit"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git web-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

# Shell Aliases
## Git Aliases
alias gst='git status '
alias gadd='git add '
alias gbr='git branch '
alias gci='git commit'
alias gdiff='git diff'
alias gco='git checkout '

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'

# alias gk='gitk --all&'
# alias gx='gitx --all'
alias update-dotfiles='sh $DOTFILES/bin/makesymlinks.sh && source ~/.zshrc'

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

if [[ `cd ~/dotfiles && git status --porcelain` ]]; then
  # Changes
  echo "\e[1mShell config has changes!\nRun \e[1;4;93mupdate-dotfiles\e[39;24m to update shell or sync $DOTFILES with git remote"
fi

# sets python version for current shell
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
