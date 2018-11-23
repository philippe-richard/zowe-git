#!/usr/bin/env bash
export jobid=$@ 
echo jobid is: $jobid 
set +x


zowe console issue cmd "SE '$jobid was submitted and completed by ZOWE...'" -u $userid --pw $password --ru false
RESULT=$?
echo WTO rc is :  $RESULT
if [ $RESULT -eq 1641 ]; then exit 0; fi
 
 echo 'WTO ' $jobid 'has executed'
 #                source ./myenv

                
 	
	echo 'job completed in OUTPUT status. Final result of job:'
#	zowe zos-jobs list spool-files-by-jobid $jobid -u prichar --pw s99arlat --ru false
#	zowe zos-jobs view sfbi $jobid 2 -u prichar --pw s99arlat --ru false
#	zowe zos-jobs view sfbi $jobid 3 -u prichar --pw s99arlat --ru false
#	zowe zos-jobs view sfbi $jobid 4 -u prichar --pw s99arlat --ru false
	
	echo ''

