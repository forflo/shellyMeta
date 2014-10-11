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
		clog 2 "[setup_createDirStruct()]" Deleting ~/repos.
	
		rm -rf ~/repos || {
			clog 1 "[setup_createDirStruct()]" error "while" deleting!
			return 1
		}
	fi

	clog 2 "[setup_createDirStruct()]" creating folder structure.
	mkdir ~/repos 2> /dev/null || echo "[setup_createDirStruct()]" Could not create folder repos
	mkdir ~/repos/git 2> /dev/null || echo "[setup_createDirStruct()]" Could not create folder git
	mkdir ~/repos/svn || echo "[setup_createDirStruct()]" Could not create foler svn
	mkdir ~/repos/mercurial || echo "[setup_createDirStruct()]" Could not create folder mercurial
	clog 2 "[setup_createDirStruct()]" folder structure has been created.
	
	return 0
}

setup_dlRepos(){
	cd ${REPOS_PATH}/git/
	for i in ${SHELLY_SUBS[*]}; do
		git clone "$i" || {
			clog 1 "[setup_dlRepos()]" Could not clone Repo ${i:0:20} ...
			return 1
		}
	done
	
	return 0
}

setup_loadFiles(){
	local meta_links=(
    		"https://raw.githubusercontent.com/forflo/shellyMeta/master/setup_conf.sh"
    		"https://raw.githubusercontent.com/forflo/shellyMeta/master/setup_lib.sh"
	)
	
	echo loading additional files
	for i in ${meta_links[*]}; do
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
		:
		
	}
	
	exit 0
}

echo Will delete everything in ~/repo
echo continue in 5 seconds
sleep 5
setup
