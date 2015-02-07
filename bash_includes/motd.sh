# Message of the day.
echo $hline
uptime
echo $hline
if [ -x /usr/games/fortune ]
then
	if [ -x /usr/games/cowsay ]
	then
		/usr/games/fortune | /usr/games/cowsay
		echo ''
	else
		echo ''
		fortune
		echo $hline
	fi
fi
