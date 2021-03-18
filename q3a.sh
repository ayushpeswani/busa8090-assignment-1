#!/bin/bash

# Question 3a - 
# Download case-cp.sh from https://www.staff.hs-mittweida.de/~wuenschi/doku.php?id=rwbook2

# case-cp.sh is a file, published on that page at address - 
# http://www.staff.hs-mittweida.de/~wuenschi/data/media/compbiolbook/chapter-10-shell-programming--case-cp.sh

curl -L -o case-cp.sh http://www.staff.hs-mittweida.de/~wuenschi/data/media/compbiolbook/chapter-10-shell-programming--case-cp.sh

# The curl command will be download the specified data and display it. We would instead like to save the file. 
# The file to save output as is specified by using argument -o together with a filename, i.e
# -o case-cp.sh
# This will save the output in file case-cp.sh; As no specific path is specified, the file will be created in the current directory. 
# 
# The -L option instructs curl to follow redirects. I.e. If the server reports that the requested page has moved to a different location 
# using a Location: header and a 3xx response code, curl will create another request for that new address. The output of this redirection
# is not itself saved.