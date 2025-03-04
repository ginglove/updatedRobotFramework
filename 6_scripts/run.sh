#!/bin/bash
################## VERIFY RUNNING ENVIRONMENT ##################
whoami
groups
pwd
ls -la
chromedriver --version


################## CONFIG ENV ##################
PWD_path="$PWD"
path_1="$(dirname $PWD)"
path="$(dirname "$(dirname $PWD)")"
parentpath="$(dirname "$(dirname "$(dirname $PWD)")")"
echo "PWD path : $PWD_path"
echo "Path : $path_1"
RESULT_FOLDER="$path_1/7_results"


ROBOT_FILES="$path_1/4_test_cases"

############ REMOVE RESULT FOLDER ##################
# echo "=== Remove result folder==="
# echo "$RESULT_FOLDER"
# rm -rf $RESULT_FOLDER/*


############ RUNNING TEST ##################
echo "=== Run robot test==="
curr_time= date +'%d-%m-%Y %T'
echo "$curr_time"
robot  -d $RESULT_FOLDER  $ROBOT_FILES

########################### ENABLE BELOW SECTION TO DISABLE TEST ##########################
echo "=== Run Robot !!! Done !!! ==="