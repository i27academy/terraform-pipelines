// this is the sample jenkins file
pipeline {
    agent {
        label 'terraform-slave'
    }
    environment {
        GCS_BUCKET = "proven-wavelet-481608-k1-cdn"
    }
    stages {
        stage ('init') {
            steps {
                echo "Initialising the terraform"
                sh 'terraform init --backend-config="bucket=${env.GCS_BUCKET}" --backend-config="prefix=state_folder"'
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


