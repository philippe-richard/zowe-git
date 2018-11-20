#!/usr/bin/env bash
set +x

 // unstash the temp file and apply it
                 source ./myenv

                // now continue on with variables set 
                echo jobid is :  $jobid
	
	echo 'job completed in OUTPUT status. Final result of job:'
	zowe zos-jobs list spool-files-by-jobid $jobid -u prichar --pw s99arlat --ru false
	zowe zos-jobs view sfbi $jobid 2 -u prichar --pw s99arlat --ru false
	zowe zos-jobs view sfbi $jobid 3 -u prichar --pw s99arlat --ru false
	zowe zos-jobs view sfbi $jobid 4 -u prichar --pw s99arlat --ru false
	
	echo ''
echo 'WTO $jobid has executed'
zowe console issue cmd "SE '$jobid' was submitted and completed by ZOWE" -u prichar --pw s99arlat --ru false
