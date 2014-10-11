SHELLY_SUBS=(
    "https://github.com/forflo/shellyCode.git"
    "https://github.com/forflo/shellyRepo.git"
    "https://github.com/forflo/shellyConfig.git"
    "https://github.com/forflo/shellyEditor.git"
)


THIS_CONFIG=".environment.conf"

SYSLINK_PATH="syslink"
SYSCONF_PATH="sysconf"
CONFIGDIR="/etc/"
WIFI="no"
EDITOR="vim"
PKG_MGMT=""
REPO="$HOME/environment/"
REPOS_PATH="$HOME/repos"
BASH_LIB="$REPO/code/shell/"
GLOB_BASHRC="bashrc"
GLOB_BASH_PROFILE="profile"
ENV_IS="THERE"
UMASK_STD="0077"
USER_FOLDER=""
STUDDOC=""
#Python environment
PYTHONSTARTUP="$HOME/.pythonrc"
#Perl configuration
PERL5LIB="$HOME/perl5/lib/perl5"

##
# Variables to be written in ~/.environment.conf
##
ENV_LIST=(
    "THIS_CONFIG"
    "UMASK_STD"
    "SYSLINK_PATH"
    "SYSCONF_PATH"
    "CONFIGDIR"
    "USER_FOLDER"
    "STUDDOC"
    "WIFI"
    "EDITOR"
    "PKG_MGMT"
    "REPO"
    "REPOS_PATH"
    "BASH_LIB"
    "GLOB_BASHRC"
    "GLOB_BASH_PROFILE"
    "ENV_IS"
    "PYTHONSTARTUP"
    "PERL5LIB"
    "PATH"
)

#-----------------------------------------

##
# Variables used to configure the behaviour of the
# install suite itself
##
INST_CERT_LOCALDIR="$HOME/environment/data/certs/"
INST_CERT_SYSDIR="/usr/share/ca-certificates/"
INST_CERT_DB="/etc/ca-certificates.conf"
                                                
