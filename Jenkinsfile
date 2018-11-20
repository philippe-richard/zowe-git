pipeline {
    agent any
	environment {
                CREDENTIALS = credentials('zowe-credentials')
					}
    stages {
        stage('password')  {
	steps {		
    withCredentials([usernamePassword(credentialsId: 'testpwd', usernameVariable: 'userid', passwordVariable: 'password')])
	{
        sh './script.sh'
   	}
	}
	}
		stage('---credentials---') {
		environment {
              SCRIPT = "./zowe_submit_cred.sh"
             					}
            steps {
			 timeout(time: 2, unit: 'MINUTES') {
                    echo 'Setup Profile Credentials'
				    echo 'Providing credentials to zowe mainframe'
					 echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
					echo "Creds:  ${env.CREDENTIALS_USR} ${env.CREDENTIALS_PSW}"
					echo "Creds:  $CREDENTIALS_USR  $CREDENTIALS_PSW"
					echo "zowe Creds:  ${env.ZOWE_OPT_USER} ${env.ZOWE_OPT_USER_PWD}"
				sh "chmod +x $SCRIPT && $SCRIPT"
		            }
			  }
        }
        
        stage('Build - Deploy - Test') {
            environment {
                RUN_SCRIPT = "./run_demo.sh"
                DEMO_SCRIPT = "./zowe_submit_job.sh"
				            }
            steps {
                timeout(time: 4, unit: 'MINUTES') {
                    echo 'Build - Deploy - Test'
                    sh "chmod +x $RUN_SCRIPT && chmod +x $DEMO_SCRIPT && $RUN_SCRIPT"
                }
            }
		}
		stage('Cleanup and inform') {
            environment {
                                SCRIPT = "./zowe_submit_output.sh"
				            }
            steps {
                timeout(time: 1, unit: 'MINUTES') {
                    echo 'Final result of job'
                    sh "chmod +x $SCRIPT && $SCRIPT"
                }
            }
		}
    }
}