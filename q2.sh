#!/bin/bash

# Question 2 - funny.sh [argument]
# Return some text if a argument is not supplied,
# or alternative text is a argument is supplied.

# NB - this question requires the inclusion of 'written document'. 
# This has been taken to mean the inline documentation in this file

# The script begins with a 'shebang' on the first line. This line is not script code per se. 
# Instead, a shebang instructs the operating system (OS) which program should handle executing 
# the code. THis script uses /bin/bash, which is the location of Bash, a shell and command 
# language that is very common on Unix and Linux systems. Bash provides the following commands
# and handles their execution.
# Bash will be started by the OS, and the script will be passed to Bash as an argument. 
# Script lines starting with a # are comments, rather than code to be executed, so are ignored.

# If no arguments were specified, output -
# 'This is funny'
if [ "$#" -eq 0 ]; then
    echo "This is funny"
	# The script is complete, exit will stop execution 
	exit
fi

# It should be noted that the question does not clearly specify if
# the alternate output should be shown if only one argument was supplied,
# or more than one. The following code demonstrates how to detect that 
# exactly one argument was supppled.  
# If one argument was specified, output -
# 'This is NOT funny'
if [ "$#" -eq 1 ]; then
    echo "This is NOT funny"
	# The script is complete, exit will stop execution 
	exit
fi

# It should be noted that the question does not specify what should happen
# if more than one argument was supplied. To demonstrate how this case
# could be handled, the code will warn the user and exit 
# if more than one argument was supplied - 
if [ "$#" -gt 1 ]; then
    echo "$0 [argument]"
    echo "Please specify either one or no arguments"
	# call exit to stop the script and specify a value. By convention
	# values less than 0 signify errors. Although a user would not see 
	# this return value directly, it could indicate to another script 
	# that an error occurred. This contrasts with the exit statements above. These
	# do not specify a value. exit will return 0 by default, indicating no errors
	exit -1
fi






