#!/bin/bash

# Question 3a - chime.sh
# Sound a chime depending on the current time

# This script requires no parameters. If one or more are supplied,
# exit the script
if [ "$#" -gt 0 ]; then
    echo "$0"
    echo "Sound a chime depending on the current time"
	echo "This script requires no parameters"
	# call exit to stop the script and specify a value. By convention
	# values less than 0 signify errors. Although a user would not see 
	# this return value directly, it could indicate to another script 
	# that an error occurred.
	exit -1
fi

# The script logic should sound the following chimes:
# - None if the time lies between 0 and 20 minutes past the hour
# - One chime if the time lies between 20 minutes and 40 minutes past the hour
# - Two chimes if the time lies between 40 minutes and 60 minutes past the hour. 
# Between these two chimes, the script should sleep for 1 second

# Get the current time and store it in a variable. To do this, date is called
# which will return the current date and time. A format parameter is specified which
# extracts the minutes value. 
# This command is enclosed in $(), which is command substitution - Bash 
# executes the command in a subshell environment, and then substitutes this command 
# with it standard output. This output i then assigned to a variable.
minutes=$(date +"%M")
minutes=59
echo $minutes

if [ "$minutes" -ge 0 ] && [ "$minutes" -lt 20 ]; then
	#between 0 and 20 minutes
	echo "no chime"
fi
if [ "$minutes" -ge 20 ] && [ "$minutes" -lt 40 ]; then
	#between 20 minutes and 40 minutes
	echo "one chime"
	printf '\a'
fi
if [ "$minutes" -ge 40 ] && [ "$minutes" -le 59 ]; then
	#between 40 minutes and 60 minutes
	echo "First chime of two"
	printf '\a'
	sleep 1
	echo "Second chime of two"
	printf '\a'
fi

# NB - the question as written does not explicitly state what should happen
# if a minute value is 0, 20 or 40. 'Between' has been taken to mean
# a value can be equal to or greater than the minimum, and less than the maximum, 
# or equal to 59 minutes in the third case.
#
# NB - a standard bell command has been issued to signify the chimes. As sounds can easily
# be disabled by the user, a visual representation is also supplied