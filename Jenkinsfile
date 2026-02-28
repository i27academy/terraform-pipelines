// this is the sample jenkins file
pipeline {
    agent {
        label 'terraform-slave'
    }
    environment {
        GCS_BUCKET = "proven-wavelet-481608-k1-cdn"
        GOOGLE_APPLICATION_CREDENTIALS = "${WORKSPACE}/sa-key.json"
    }
    stages {
        stage ('auth') {
            steps {
                withCredentials([file(credentialsId: 'gcp-service-account-key', variable: 'SA_KEY')]) {
                    // some block
                    sh '''
                        cp $SA_KEY $GOOGLE_APPLICATION_CREDENTIALS
                    '''
                }
                // /home/admin_/jenkins/workspace/terraform-pipelines

            }
        }
        stage ('init') {
            steps {
                echo "Initialising the terraform"
                sh """
                    terraform init --backend-config="bucket=${env.GCS_BUCKET}" --backend-config="prefix=statefolder"
                """
            }
        }
        stage ('plan') {
            steps {
                echo "Executing the plan for terraform "
            }
        }
        stage ('apply') {
            steps {
                echo "Applying terraform infra"
            }
        }
        stage ('destroy') {
            steps {
                echo "Destroying the infra"
            }
        }
    }
}


