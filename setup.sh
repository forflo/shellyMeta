#!/bin/bash

##
# /home/<user>
# -> repos/
#		-> git/
#		-> svn/
#		-> mercurial/
##
setup_createDirStruct(){
	cd
	
	echo "[setup_createDirStruct()]" checking folder structure.
	if [ -d ~/repos ]; then
		echo "[setup_createDirStruct()]" The folder ~/repos already exists.
		echo "[setup_createDirStruct()]" Do you want it to be deleted?
		read -p "(yes/no) " READ_C
		case "${READ_C}" in
			([Yy][Ee][Ss])
				rm -rf ~/repos
				[ $? -gt 0 ] && {
					echo "[setup_createDirStruct()]" error while deleting!
					return 1
				}
				;;
			([Nn][Oo])
				echo "[setup_createDirStruct()]" Will not delete the existing repos.
				;;
			(*)
				echo "[setup_createDirStruct()]" You did not choose!
				return 1
				;;
		esac
	fi

	echo "[setup_createDirStruct()]" creating folder structure.
	mkdir ~/repos 2> /dev/null || echo "[setup_createDirStruct()]" repos folder already existed.
	mkdir ~/repos/git 2> /dev/null || echo "[setup_createDirStruct()]" git repo already folder existed.
	mkdir ~/repos/svn || echo "[setup_createDirStruct()]" svn repo folder already existed.
	mkdir ~/repos/mercurial || echo "[setup_createDirStruct()]" mercurial repo folder already existed.
	echo "[setup_createDirStruct()]" folder structure has been created.
	
	return 0
}

setup_dlRepos(){
	cd ${REPOS_PATH}
	for i in ${SHELLY_SUBS[*]}; do
		git clone "$i" || {
			echo "[setup_dlRepos()]" Could not clone Repo ${i:0:20} ...
			return 1
		}
	done
	
	return 0
}

setup_init(){
	echo installing shelly subsystems
	
	setup_createDirStruct || {
		echo Could not setup the directory structure!
		exit 1
	}
	
	setup_dlRepos || {
		echo Could not download other shelly repos
		exit 1
	}
	
	exit 0
}

setup_init
