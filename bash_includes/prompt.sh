#!/bin/bash

# Load in the git branch prompt script.
source ~/dot-files/bash_includes/git-prompt.sh

# Change the command line prompt to display git info.
export PS1='[\u@\h \W\[\e[32m\]$(__git_ps1 " (%s)")\[\e[m\]]\$ '
export GIT_PS1_SHOWDIRTYSTATE=1     # * for unstaged changes, + for staged changes.
export GIT_PS1_SHOWUNTRACKEDFILES=1 # % for untracked files.

# Whenever displaying the prompt, write the previous line to disk so that new
# shells get the history lines from all previous shells.
export PROMPT_COMMAND='history -a'
