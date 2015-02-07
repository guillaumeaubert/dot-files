# Enable appending to the history file instead of replacing it (histappend) and
# attempt to save correctly all the lines of a multiple lines command
# (cmdhist).
shopt -s histappend cmdhist

# Checks the window size after each command and, if necessary, update the
# values of the variables LINES and COLUMNS.
shopt -s checkwinsize
