# Add /usr/games to the path for Debian to find cowsay and fortune.
PATH=$PATH:/usr/games

# Message of the day.
echo $hline
uptime
echo $hline
if command -v fortune >/dev/null
then
	if command -v cowsay >/dev/null
	then
		fortune | cowsay
		echo ''
	else
		echo ''
		fortune
		echo $hline
	fi
fi
