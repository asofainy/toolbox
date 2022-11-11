#!/bin/bash 

###################################################################
#Script Name	:
#Version	:                                                                                              
#Description	: Template                                                                                
#Args           :                                                                                           
#Author       	:                                             
#Email         	:                                     
###################################################################

# Colors

BLACK="\e[30m"
BLUE="\e[34m"
GREEN="\e[32m"
CYAN="\e[36m"
RED="\e[31m"
PURPLE="\e[35m"
BROWN="\e[33m"
YELLOW="\e[33m"

export BLACK BLUE GREEN CYAN RED PURPLE BROWN YELLOW

## Variables des couleurs

COL_NORM="\e[0m"
COL_SH="$GREEN"
COL_VAR="$PURPLE"
COL_INFO="$CYAN"
COL_NOTICE="$BROWN"
COL_WARN="$YELLOW"
COL_ERR="\e[31m"
COL_DEBUG="\e[34m"
COL_OK="\e[32m"
COL_KO="\e[31m"
COL_MOD="\e[35m"

export COL_NORM COL_SH COL_VAR COL_INFO COL_WARN COL_ERR COL_DEBUG COL_OK COL_KO COL_MOD

## Variables des severites

SVR_DOWN="|______|"
SVR_EMPTY="|      |"
SVR_DEB="| DEB! |"
SVR_FIN="| FIN! |"
SVR_INFO="${COL_INFO}INFO${COL_NORM}"
SVR_NOTICE="| ${COL_NOTICE}NOTICE${COL_NORM} |"
SVR_WARN="[ ${COL_WARN}WARN${COL_NORM} ]"
SVR_ERR="| ${COL_ERR}ERR!${COL_NORM} |"
SVR_STDERR="|${COL_ERR}STDERR${COL_NORM}|"
SVR_DEBUG="| ${COL_DEBUG}DBG1${COL_NORM} |"
SVR_DEBUG_2="| ${COL_DEBUG}DBG2${COL_NORM} |"
SVR_DEBUG_3="| ${COL_DEBUG}DBG3${COL_NORM} |"
SVR_OK="[  ${COL_OK}OK${COL_NORM}  ]"
SVR_KO="[  ${COL_KO}KO${COL_NORM}  ]"

export SVR_DEB SVR_FIN SVR_EMPTY SVR_DOWN SVR_INFO SVR_WARN SVR_NOTICE SVR_ERR SVR_DEBUG SVR_DEBUG_2 SVR_DEBUG_3 SVR_OK SVR_KO

## Variables des date

DATE_LOG="`date +'%H:%M:%S %d-%m-%Y'`"
DATE_FIC="`date +'%Y%m%d'`"
DATE_FIC2="`date +'%Y%m%d_%H%M%S'`"

export DATE_LOG DATE_FIC DATE_FIC2

## Variables nom de fichiers

script=$CURRENT_SCRIPT
file_name=`basename $script`
script_name=${file_name%%.*}

FLAG="${script_name}_${UNXAPPLI}.flag"

LOG_FILE="$UNXLOG/${script_name}_${UNXAPPLI}_`date +%Y%m%d`.log"
LOG_FILE_CENTRAL="$UNXLOG/central_${UNXAPPLI}_`date +%Y%m%d`.log"
LOG_FILE_DOCKER_COMPOSE=$UNXLOG/docker-compose_`date +%Y%m%d`.log

export LOG_FILE FLAG LOG_FILE_CENTRAL LOG_FILE_DOCKER_COMPOSE


## Variables des date

DATE_LOG="`date +'%H:%M:%S %d-%m-%Y'`"
DATE_FIC="`date +'%Y%m%d'`"
DATE_FIC2="`date +'%Y%m%d_%H%M%S'`"

HEADER_LOG="$COL_SH${file_name}$COL_NORM|$DATE_LOG "

export DATE_LOG DATE_FIC DATE_FIC2 HEADER_LOG
