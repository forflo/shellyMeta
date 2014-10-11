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
	
	clog 2 "[setup_createDirStruct()]" checking folder structure.
	if [ -d ~/repos ]; then
		clog 2 "[setup_createDirStruct()]" The folder ~/repos already exists.
		clog 2 "[setup_createDirStruct()]" Do you want it to be deleted?
		read -p "(yes/no) " READ_C
		case "${READ_C}" in
			([Yy][Ee][Ss])
				rm -rf ~/repos
				[ $? -gt 0 ] && {
					clog 1 "[setup_createDirStruct()]" error "while" deleting!
					return 1
				}
				;;
			([Nn][Oo])
				clog 1 "[setup_createDirStruct()]" Will not delete the existing repos.
				;;
			(*)
				clog 1 "[setup_createDirStruct()]" You did not choose!
				return 1
				;;
		esac
	fi

	clog 2 "[setup_createDirStruct()]" creating folder structure.
	mkdir ~/repos 2> /dev/null || echo "[setup_createDirStruct()]" repos folder already existed.
	mkdir ~/repos/git 2> /dev/null || echo "[setup_createDirStruct()]" git repo already folder existed.
	mkdir ~/repos/svn || echo "[setup_createDirStruct()]" svn repo folder already existed.
	mkdir ~/repos/mercurial || echo "[setup_createDirStruct()]" mercurial repo folder already existed.
	clog 2 "[setup_createDirStruct()]" folder structure has been created.
	
	return 0
}

setup_dlRepos(){
	cd ${REPOS_PATH}
	for i in ${SHELLY_SUBS[*]}; do
		git clone "$i" || {
			clog 1 "[setup_dlRepos()]" Could not clone Repo ${i:0:20} ...
			return 1
		}
	done
	
	return 0
}

setup_loadFiles(){
	echo loading additional files
	
	for i in ${META_LINKS[*]}; do
		eval "$(curl ${i})" || {
			echo Could not evaluate code for ${i:0:30} ... .
			return 1
		}
	done
	
	return 0
}

setup(){
	setup_loadFiles || {
		echo Could not get library files
		exit 1
	}
	
	clog 2 "setup_init()" installing shelly subsystems.
	setup_createDirStruct || {
		clog 1 "setup_init()" Could not setup the directory structure!
		exit 1
	}
	
	setup_dlRepos || {
		clog 1 "setup_init()" Could not download other shelly repos
		exit 1
	}
	
	start_repoInits(){
		
		
	}
	
	exit 0
}


setup
