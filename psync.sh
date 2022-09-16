#!/bin/bash
#=========================================================================#
# psync.sh - Parallel rsync                                               #
#-------------------------------------------------------------------------#
# Chad Kerner - chad.kerner@gmail.com                                     #
#=========================================================================#

#set -x

DEFAULT_WIDTH=3
DEFAULT_DEPTH=1

function check_required () {
# Check for required packages
   RSYNC=$( which rsync 2>/dev/null )
   if [ "x${RSYNC}" == "x" ] ; then
      echo "ERROR: rsync must be installed on the system and in the path."
      exit 101
   fi

   PARALLEL=$( which parallel 2>/dev/null )
   if [ "x${PARALLEL}" == "x" ] ; then
      echo "ERROR: GNU Parallel must be installed on the system and in the path."
      exit 102
   fi
}

function print_usage() {
    PROG=$( basename $0 )
    cat <<EOUSAGE

    Usage: ${PROG} [ OPTIONS ]  SOURCE_LOCATION   TARGET_LOCATION

    Option        Usage
    -d|--depth    How deep to go on the directory to parallelize
                  Default Depth: ${DEFAULT_DEPTH}

    -w|--width    How many parallel sync's to run
                  Default Width: ${DEFAULT_WIDTH}

    -h|--help     This help screen
    -v|--verbose  Run in verbose mode
    -D|--debug    Run in debug mode( set -x )


EOUSAGE

    exit 1
}

function parse_options {
   ARGS=()
   while [[ $# -gt 0 ]]; do
      case "$1" in
        -h|--help)     print_usage ;;
	-D|--debug)    set -x ;;
	-v|--verbose)  VERBOSE=1 ;;
	-w|--width)    WIDTH=$2 ; shift  ;;
	-d|--depth)    DEPTH=$2 ; shift  ;;
	*)             ARGS+=("$1") ;;
      esac
      shift
   done

   [[ ${VERBOSE:=0} ]]
   [[ ${WIDTH:=$DEFAULT_WIDTH} ]]
   [[ ${DEPTH:=$DEFAULT_DEPTH} ]]

   return 0
}

# Main Code Block
{
   parse_options "$@"

   check_required

   SOURCE_DIR=${ARGS[0]}
   TARGET_DIR=${ARGS[1]}

   if [[ ${VERBOSE} -eq 1 ]] ; then
      cat <<EOV
      Parallel Rsync Active Parameters

      Rsync Comand: ${RSYNC}
      Parallel Command: ${PARALLEL}

      Width: ${WIDTH}
      Depth: ${DEPTH}

      Source: ${SOURCE_DIR}
      Target: ${TARGET_DIR}
EOV
   fi

}

