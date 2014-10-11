# Useful functions for install.sh
# Author: Florian Mayer
# Date: 2.5.2014
##

write_var_to_file(){
	if [[ "$1" = "" ]]; then
		return 1
	fi
	if [[ "$2" = "-e" ]]; then
		echo -n "export " >> $HOME/$THIS_CONFIG
	fi
	# first write variable name then the content
	echo "$1"=\"$(eval echo \$"$1")\" >> $HOME/$THIS_CONFIG
	return 0
}

write(){
	write_var_to_file "$1" "$2"
}

