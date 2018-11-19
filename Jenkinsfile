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
		environment {
              SCRIPT = "./zowe_submit_job.sh"
			   CREDENTIALS = credentials('zowe-credentials')
              		}
            steps {
                sh "echo 'submitting job to mainframe via zowe'"
				sh "chmod +x $SCRIPT && $SCRIPT"
		          }
        }
        stage('--Show job output--') {
		environment {
              SCRIPT = "./zowe_submit_job.sh"
			   CREDENTIALS = credentials('zowe-credentials')
              		}
		  steps {
            sh "echo 'Showing mainframe job output via zowe'"
			sh "chmod +x $SCRIPT && $SCRIPT"
				}
        }
    }
}