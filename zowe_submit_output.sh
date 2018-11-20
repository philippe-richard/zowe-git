#!/usr/bin/env bash
set +x

 // unstash the temp file and apply it
                unstash 'myenv'
                sh 'source ./myenv'

                // now continue on with variables set 
                sh 'echo jobid is :  $jobid'
	
	echo 'job completede in OUTPUT status. Final result of job:'
	zowe zos-jobs list spool-files-by-jobid $jobid 
	zowe zos-jobs view sfbi $jobid 2 
	zowe zos-jobs view sfbi $jobid 3 
	zowe zos-jobs view sfbi $jobid 4 
	
	echo ""
echo "WTO $jobid has executed"
zowe console issue cmd "SE '$jobid' was submitted and completed by ZOWE"
