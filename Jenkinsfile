pipeline {
    agent any
    stages {
        stage('---credentials---') {
		environment {
              SCRIPT = "./zowe_submit_cred.sh"
              CREDENTIALS = credentials('zowe-credentials')
					}
            steps {
			 timeout(time: 2, unit: 'MINUTES') {
                    echo 'Setup Profile Credentials'
				    echo 'Providing credentials to zowe mainframe'
					echo "Creds:  ${env.CREDENTIALS_USR} ${env.CREDENTIALS_PSW}"
				sh "chmod +x $SCRIPT && $SCRIPT"
		            }
			  }
        }
        stage('--submit job--') {
            steps {
                sh "echo 'submitting job to mainframe via zowe'"
				sh "chmod +x zowe_submit_job.sh && zowe_submit_job.sh"
		            }
        }
        stage('--Show job output--') {
		  steps {
            sh "echo 'Showing mainframe job output via zowe'"
			sh "chmod +x zowe_submit_output.sh && zowe_submit_output.sh"
            }
        }
    }
}