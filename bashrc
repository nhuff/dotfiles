# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export EDITOR="/usr/bin/vim"
alias t=gwtf
alias c="gwtf -p cancer"

git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  echo "($git_branch)"
}

PROMPT_COMMAND='PS1="[\u@\h \W $(git_prompt)]\$"'
alias gpg=gpg2
alias ppv='puppet parser validate'
alias ppt='cd ~/repos/puppet && fab deploy_dev'
alias ppp='cd ~/repos/puppet && fab deploy_prod'

set -o vi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
