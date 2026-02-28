// this is the sample jenkins file
pipeline {
    agent {
        label 'terraform-slave'
    }
    stages {
        stage ('init') {
            steps {
                echo "Initialising the terraform"
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


