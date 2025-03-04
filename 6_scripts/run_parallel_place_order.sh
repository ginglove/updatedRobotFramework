#!/bin/bash
################## VERIFY RUNNING ENVIRONMENT ##################
whoami
groups
pwd
ls -la
chromedriver --version


################## CONFIG ENV ##################
path_1="$(dirname $PWD)"
path="$(dirname "$(dirname $PWD)")"
parentpath="$(dirname "$(dirname "$(dirname $PWD)")")"
echo "$path_1"
RESULT_FOLDER="$path_1/robot_code_base/6_results"


ROBOT_FILES="$path_1/robot_code_base/4_test_cases/Demo.robot"
USR_PASSWORD="123456"

############ REMOVE RESULT FOLDER ##################
# echo "=== Remove result folder==="
# echo "$RESULT_FOLDER"
# rm -rf $RESULT_FOLDER/*


############ RUNNING TEST ##################
echo "=== Run robot test==="
curr_time= date +'%d-%m-%Y %T'
print "$curr_time"
robot $ROBOT_FILES -d $RESULT_FOLDER

########################### ENABLE BELOW SECTION TO DISABLE TEST ##########################
echo "=== Run Robot !!! Done !!! ==="