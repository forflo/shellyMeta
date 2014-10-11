#!/bin/bash

echo installing shelly subsystems

# /home/<user>
# -> repos/
#		-> git/
#		-> svn/
#		-> mercurial/
##

echo +checking folder structure
if [ -d ~/repos ]; then
	echo "++The folder ~/repos already exists!"
	echo "++Do you want it to be deleted?"
	read -p "++(yes/no) " READ_C
	case "$READ_C" in
		([Yy][Ee][Ss])
			rm -rf ~/repos
			if [ $? -gt 0 ]; then
				echo "+++error while deleting"
				exit 1
			fi
			;;
		([Nn][Oo])
			echo +++will not delete existing repos
			;;
		(*)
			echo "+++please choose!"
			exit 1					
	esac
fi

echo "+creating folder structure"
mkdir ~/repos 2> /dev/null || echo +repos folder already existed!
mkdir ~/repos/git 2> /dev/null || echo +git repo already folder existed!
mkdir ~/repos/svn || echo +svn repo folder already existed!
mkdir ~/repos/mercurial || echo +mercurial repo folder already existed!
echo "+folder structure has been created"

