# ~/.bash_logout: executed by bash(1) when login shell exits.

# Push any commits not synced in dot-files.
cd ~/dot-files
dotfiles_push=$(git push 2>&1)
if [ "$dotfiles_push" != "Everything up-to-date" ] && [ "$dotfiles_update" != "" ]; then
	echo $HLINE;
	echo $dotfiles_update;
	echo $HLINE;
fi
cd ~

# When leaving the console clear the screen to increase privacy.
if [ "$SHLVL" = 1 ]; then
	[ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
