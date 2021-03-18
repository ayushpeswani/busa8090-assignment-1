#!/bin/bash

# Question 1 - older.sh file_1 file_2 [file_n]
# Return the name of the oldest file, of the list of files specified as arguments.

# The script begins with a 'shebang' on the first line. This line is not script code per se. 
# Instead, a shebang instructs the operating system (OS) which program should handle executing 
# the code. THis script uses /bin/bash, which is the location of Bash, a shell and command 
# language that is very common on Unix and Linux systems. Bash provides the following commands
# and handles their execution.
# Bash will be started by the OS, and the script will be passed to Bash as an argument. 
# Script lines starting with a # are comments, rather than code to be executed, so are ignored.


# If only one file was specified, there would be nothing to compare it with.
# Get the number of files specified. If one, warn the user and terminate this script.
if [ "$#" -lt 2 ]; then
    echo "$0 file_1 file_2 [file_n]"
	echo "Return the name of the oldest file"
    echo "Please specify at least two filenames"
	# call exit to stop the script and specify a value. By convention
	# values less than 0 signify errors. Although a user would not see 
	# this return value directly, it could indicate to another script 
	# that an error occurred.
	exit -1
fi

# Check each file exists
# Iterate over the list of arguments, i.e. files, supplied by shell in variable $@
for file in "$@"
do
	# Check the file exists
	if [ ! -f "$file" ]; then
		# Warn the user that the script cannot continue
		echo "File $file does not exist, cannot continue"
		# call exit to stop the script and specify a value. By convention
		# values less than 0 signify errors. Although a user would not see 
		# this return value directly, it could indicate to another script 
		# that an error occurred.
		exit -1
	fi
done

# The specified files may not exist in a single folder, so built-in tools 
# to list the contents of a folder by date will not work.
# Instead, pass the specified arguments to the find command.
# find will locate a list of files and can show properties of each.
# Use printf to include the file modified time, along with the filename.
# The output gathered above is then passed to the sort command. 
# This will sort the output alphanumerically,
# leading to the oldest file being output first. 
# The head command is then used to show only the first line of the output
# Inform the user that the result will follow.
# Each of these commands is separated by symbol | 
# This instructs bash to pass the output of the preceding command as input
# to the next.
echo "The modified date of the oldest file, and its filename, is -"
find $@ -type f -printf '%T+ %p\n' | sort | head -n 1

# It should be noted that the question requires only a single file to be output.
# In the case that multiple files have the same modified date and time,
# a non-deterministic file will be output.





