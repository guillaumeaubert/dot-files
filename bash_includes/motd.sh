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
		echo -e -n "\e[00;32m"
		fortune | cowsay
		echo -e "\e[00m"
	else
		echo ''
		fortune
		echo $hline
	fi
fi
