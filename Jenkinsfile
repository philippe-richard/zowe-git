pipeline {
    agent any
    stages {
        stage('---credentials---') {
            steps {
                sh "echo 'Providing credentials to zowe mainframe'"
		sh "zowe_submit_cred.sh"
		            }
        }
        stage('--submit job--') {
            steps {
                sh "echo 'submitting job to mainframe via zowe'"
		sh "zowe_submit_job.sh"
		            }
        }
        stage('--Show job output--') {
            sh "echo 'Showing mainframe job output via zowe'"
		sh "zowe_submit_output.sh"
            }
        }
    }
