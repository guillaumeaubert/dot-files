#!/bin/bash

# Enable appending to the history file instead of replacing it (histappend) and
# attempt to save correctly all the lines of a multiple lines command
# (cmdhist).
shopt -s histappend cmdhist

# Checks the window size after each command and, if necessary, update the
# values of the variables LINES and COLUMNS.
shopt -s checkwinsize

# Make 'cd **/d' enter './a/b/c/d' (bash 4 only).
shopt -s autocd 2> /dev/null

# Recursive globbing - ls **/*.txt (bash 4 only).
shopt -s globstar 2> /dev/null

# Hostname completion when a word containing @ is being completed.
shopt -s hostcomplete

# Do not attempt completion on empty lines.
shopt -s no_empty_cmd_completion
