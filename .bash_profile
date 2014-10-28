# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# ~/.bash_profile: executed by bash(1) for login shells.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the msys2 mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
 if [ -d "${HOME}/bin" ] ; then
   PATH="${HOME}/bin:${PATH}"
 fi

# Set MANPATH so it includes users' private man if it exists
 if [ -d "${HOME}/man" ]; then
   MANPATH="${HOME}/man:${MANPATH}"
 fi

# Set INFOPATH so it includes users' private info if it exists
 if [ -d "${HOME}/info" ]; then
   INFOPATH="${HOME}/info:${INFOPATH}"
 fi


# My mount point
#mount -fo binary,noacl,posix=0,user D:/docs ~/docs

# My Environment Variable
export EDITOR=vim

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi
if [ -f ~/.git-prompt.sh ]; then
	. ~/.git-prompt.sh
fi


#PS1='\033]0;${PWD}\n\033[32m${USER}@${HOSTNAME} \033[33m${PWD/${HOME}/~}\033[0m\n$ '
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\]\n$ '


