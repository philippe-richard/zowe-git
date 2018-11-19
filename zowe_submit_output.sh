#!/usr/bin/env bash
set +x

	
	echo 'job completede in OUTPUT status. Final result of job:'
	zowe zos-jobs list spool-files-by-jobid $jobid -H 9.212.128.238 -P 9143 -u prichar --pw s99arlat --ru false
	zowe zos-jobs view sfbi $jobid 2 -H 9.212.128.238 -P 9143 -u prichar --pw s99arlat --ru false
	zowe zos-jobs view sfbi $jobid 3 -H 9.212.128.238 -P 9143 -u prichar --pw s99arlat --ru false
	zowe zos-jobs view sfbi $jobid 4 -H 9.212.128.238 -P 9143 -u prichar --pw s99arlat --ru false
