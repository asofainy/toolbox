#!/bin/bash 

###################################################################
#Script Name	:
#Version		:                                                                                              
#Description	: Template                                                                                
#Args           :                                                                                           
#Author       	:                                             
#Email         	:                                     
###################################################################

function header_script( ) {

	echo -e "${COL_DEBUG}${FUNCNAME[0]}${COL_NORM}: [\$args:${COL_VAR}$@${COL_NORM}]" >&3

	echo -e "${COL_DEBUG}$CURRENT_SCRIPT${COL_NORM} [\$args:$1]" >&3
    echo -e "${COL_DEBUG}$CURRENT_SCRIPT${COL_NORM} [\$args_parsed:$ARGS_PARSED]" >&3

}

export -f header_script

function footer_script( ) {

	echo -e "${COL_DEBUG}${FUNCNAME[0]}${COL_NORM}: [\$args:${COL_VAR}$@${COL_NORM}]" >&3

	echo -e "$1" >&3
    echo -e "${COL_DEBUG}$CURRENT_SCRIPT${COL_NORM}" >&3

}

export -f footer_script

function header( ) {

##ATTENTIO CAUSE BUG ##
#	echo -e "${COL_DEBUG}${FUNCNAME[0]}${COL_NORM}: [\$args:${COL_VAR}$@${COL_NORM}]"

	diff=0
	max=10
	#date=`date +'%d-%m-%Y %H:%M:%S'`
	script_name="`basename $CURRENT_SCRIPT`"
	module_name="$CURRENT_MODULE"
	blank=""
	

	if [ $module_name == "calibre" ]
	then
		COL_MOD="$CYAN"
	elif [ $module_name == "openkm" ]
	then
		COL_MOD="$BLUE"
	else
		COL_MOD="$PURPLE"
	fi

	export COL_MOD

	string="${module_name}"

	let len=$(( ${#string} ))

	if [[ $len -lt $max ]]
	then
		let diff=$(( $max - $len))
		while [[ $diff > 0 ]]
		do
			blank+=" "
			let diff=$(( $diff-1 ))
		done
	fi

	echo -e "${COL_MOD}${string}${blank}|${COL_NORM}"`date +'%d-%m-%Y %H:%M:%S'`"${COL_MOD}|${COL_NORM}"
}

export -f header

function separator( ) {

		sep=""
        diff=0
        max=50
		script_name="`basename $CURRENT_SCRIPT`"

        let len=$(( ${#script_name} ))

        if [[ $len -lt $max ]]
        then
                let diff=$(( $max - $len))

                while [[ $diff > 0 ]]
                do
                        sep+="="
                        let diff=$(( $diff-1 ))
                done
        fi

		echo -n ""
        echo -e "[${COL_SH}${script_name}${COL_NORM}] ${sep} "
}

export -f separator


function wait_for( ) {

	echo -e "${COL_DEBUG}${FUNCNAME[0]}${COL_NORM}: [\$args:${COL_VAR}$@${COL_NORM}]" >&3

        cpid=$1

	echo -e "en attente du process fils [\$cpid=${COL_VAR}$cpid${COL_NORM}]" >&3

	wait $cpid
}

export -f wait_for





function test_rc ( ) {

	echo -e "${COL_DEBUG}${FUNCNAME[0]}${COL_NORM}: [\$args:${COL_VAR}$@${COL_NORM}]" >&3

    rc=$1
	msg="$2"
	date_start=$3
	date_end=`date +%s`
	ignore_rc=false

	if [[ $4 == true ]]; then ignore_rc=true ; else let rcs=$rcs+$rc ; fi

	if [[ $date_start != "" && $date_start != -1 ]] ; then let duree=$date_end-$date_start ; else  duree=-1 ; fi


	output="\$exec=${COL_VAR}"$duree"${COL_NORM}s | \$rc=${COL_VAR}$rc${COL_NORM} | \$ignore_rc=$ignore_rc | \$flag_create=$COL_VAR$FLAG_CREATE$COL_NORM"
        echo -e "$output" >&3

	sleep 1

        if [[ $rc = 0 ]]
	then
		echo -e "${SVR_OK} $msg"

	elif [[ $rc = $RC_ANNULE  ]]
        then
		echo -e "${SVR_WARN} $msg"
	else
                if [[ ! -f $FLAG ]] && [[ $FLAG_CREATE = 1 ]]
                then
			if [[ $ignore_rc == false ]]
			then
	               	        touch $UNXEXFLAG/$FLAG
				echo -e "${SVR_KO} Le flag ${COL_VAR}$FLAG${COL_NORM} a été crée ! $msg" 1>&2
				msg="exit"
			fi
        	fi 	

       	fi

	if [[ $msg == "exit" ]]; then exit $rc  ; fi

}

export -f test_rc



function calcul_diff_space ( ) {

	echo -e "${COL_DEBUG}${FUNCNAME[0]}${COL_NORM}: [\$args:${COL_VAR}$@${COL_NORM}]" >&3

	before=$1
	after=$2

	b=`echo  $before |  numfmt --from=auto --to=none`
        a=`echo  $after |  numfmt --from=auto --to=none`

        let diff=$(( $b-$a ))

	printf "$diff\n" >> $FREED_SPACE_FILE

        diff_h=`echo $diff | numfmt --to=si`

        echo -e "espace libéré:$COL_INFO $diff_h $COL_NORM|avant:$COL_INFO $before $COL_NORM|après:$COL_INFO $after $COL_NORM"
	
}

export -f calcul_diff_space
