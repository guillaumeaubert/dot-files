# Message of the day.
hline=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | sed -e 's/ /─/g')
echo $hline
uptime
echo $hline
if [ -x /usr/games/fortune ]
then
	if [ -x /usr/games/cowsay ]
	then
		fortune | cowsay
		echo ''
	else
		echo ''
		fortune
		echo $hline
	fi
fi
