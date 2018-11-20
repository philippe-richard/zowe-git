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
        
        stage('Build - Deploy - Test') {
            environment {
                RUN_SCRIPT = "./run_demo.sh"
                DEMO_SCRIPT = "./zowe_submit_job.sh"
				CREDENTIALS = credentials('zowe-credentials')
            }
            steps {
                timeout(time: 4, unit: 'MINUTES') {
                    echo 'Build - Deploy - Test'
                    sh "chmod +x $RUN_SCRIPT && chmod +x $DEMO_SCRIPT && $RUN_SCRIPT"
                }
            }
		}
    }
}