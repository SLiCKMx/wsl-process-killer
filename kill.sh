#!/bin/bash
# WSL Process Killer by sl0ck
IFS=$'\n'

RESET='\033[0m'
CYAN='\033[1;36m'
GOLD='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'

if [ $# -eq 0 ]
then
	echo "Usage: kill.sh [PROCESS_NAME]"; exit 1
fi

cmd.exe /C taskkill /F /IM $1.exe &> /tmp/proc_out

out=$(cat /tmp/proc_out)
pid_arr=()
for line in $out
do
	if [[ $line == SUCCESS* ]]
	then
		proc_name=$(echo $line | cut -d " " -f 4)
		tmp=$(echo $line | cut -d " " -f 7)
		pid_arr+=("${CYAN}$tmp${RESET}")
	fi
done


pid_str=$(printf ", %s" "${pid_arr[@]}")
pid_str=${pid_str:2}
proc_name=${proc_name:1:-1}

if [ ${#pid_arr[@]} -eq 0 ]
then
	echo -e "${RED}ERROR${RESET} Process \"${GOLD}$1${RESET}\" not found."
else
	echo -e "${GREEN}SUCCESS${RESET} Process \"${GOLD}$proc_name${RESET}\" with PID(s) $pid_str killed successfully."
fi

rm /tmp/proc_out
