#!/usr/bin/env bash
set +x

	
	echo 'job completede in OUTPUT status. Final result of job:'
	zowe jobs list spool-files-by-jobid $jobid
	zowe jobs view sfbi $jobid 2
	zowe jobs view sfbi $jobid 3
	zowe jobs view sfbi $jobid 4
