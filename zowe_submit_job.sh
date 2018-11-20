#!/usr/bin/env bash
set +x
zowe profiles create zosmf-profile tx9 --host 9.212.128.238 --port 9143 -u $CREDENTIALS_USR -p $CREDENTIALS_PSW --reject-unauthorized false --overwrite
echo " zosmf check status"
#zowe zosmf check status --zosmf-profile tx9 -H 9.212.128.238 -P 9143 -u prichar --pw s99arlat --ru false
zowe zos-jobs submit data-set "prichar.x9.jcl(iefbr14)" 
echo "Downloading the IEFBR14 program"
zowe files dl ds "prichar.x9.jcl(iefbr14)" -f iefbr14.jcl 
echo "Editing iefbr14 locally to update it"
echo ""
#notepad iefbr14.jcl 
echo "Uploading the IEFBR14 program"
zowe files ul ftds iefbr14.jcl "prichar.x9.jcl(iefbr14)" 

echo ""
echo "Submitting the iefbr14 program"
#zowe zos-jobs sub lf iefbr14.jcl --vasc 
tries=20
wait=5
function submitJCL () {
    ds=$1

    echo 'zowe zos-jobs submit data-set "'$ds'" --rff jobid --rft string'
    jobid=`zowe zos-jobs submit data-set $ds --rff jobid --rft string `
    echo $jobid
    echo ''

    echo 'zowe zos-jobs view job-status-by-jobid' $jobid '--rff retcode --rft string'
    retcode=`zowe zos-jobs view job-status-by-jobid $jobid --rff retcode --rft string `
    echo $retcode
    echo ''
    
    counter=0
    while (("$counter" < $tries)) && [ "$retcode" == "null" ]; do
        counter=$((counter + 1))
        sleep $wait
        
        echo 'zowe zos-jobs view job-status-by-jobid' $jobid '--rff retcode --rft string'
        retcode=`zowe zos-jobs view job-status-by-jobid $jobid --rff retcode --rft string `
        echo $retcode
        echo ''
    done
	
	
}

submitJCL "PRICHAR.X9.JCL(IEFBR14)"
#echo 'job completede in OUTPUT status. Final result of job:'
	zowe zos-jobs list spool-files-by-jobid $jobid 
	zowe zos-jobs view sfbi $jobid 2 
	zowe zos-jobs view sfbi $jobid 3 
	zowe zos-jobs view sfbi $jobid 4 
echo 'job id is :' $jobid
echo 'export jobid='$jobid '> myenv'
  // stash away for later use
 stash 'myenv'