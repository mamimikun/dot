#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:$HOME/altera/13.1chingon/quartus/bin
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:/opt/cisco/anyconnect/bin
export PATH=$PATH:$HOME/Xscripts

# dotfile management

alias dotgit='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
dotgit config --local status.showUntrackedFiles no




