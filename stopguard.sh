#!/bin/bash

argument_section=0
always_restart=false
cmd=""
exit_code=1

for arg in "$@"
do

	if [ $argument_section -eq 0 ]
	then
		if [ "$arg" == "--" ]
		then
			argument_section=1
		elif [ "$arg" == "-a" ]
		then
			always_restart=true
		else
			echo "Unrecognized option: $arg"
			exit 1
		fi
	else
		cmd="$cmd $arg"
	fi

done

if [ $argument_section -eq 0 ]
then
	echo "No command was given."
	exit 1
fi



while [ $exit_code -ne 0 ] || [ $always_restart == true ]
do
	sh -c "$cmd"
	exit_code=$?
	echo "[stopguard] Program ended with code $exit_code."
done

