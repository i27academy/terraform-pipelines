// this is the sample jenkins file
pipeline {
    agent {
        label 'terraform-slave'
    }
    parameters {
        choice (
            name: 'ENVIRONMENT',
            choices: ['dev', 'test', 'stage', 'prod'],
            description: 'Choose the env to deploy'
        )
        choice (
            name: 'ACTION',
            choices: 'validate\ninit\nplan\napply\ndestroy'
        )
    }
    environment {
        GCS_BUCKET = "proven-wavelet-481608-k1-cdn"
        GOOGLE_APPLICATION_CREDENTIALS = "${WORKSPACE}/sa-key.json"
        TFVARS_FILE = "${params.ENVIRONMENT}.tfvars"
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
                    terraform init --backend-config="bucket=${env.GCS_BUCKET}" --backend-config="prefix=${params.ENVIRONMENT}"
                """
            }
        }
        stage ('plan') {
            when {
                expression {
                    params.ACTION == 'plan'
                }
            }
            steps {
                echo "Executing the plan for terraform "
                sh "terraform plan -var-file=${env.TFVARS_FILE}"
            }
        }
        stage ('apply') {
            when {
                expression {
                    params.ACTION == 'apply'
                }
            }
            steps {
                // abort if the input is not provided within 300 SECONDS 
                timeout (time: 300, unit: 'SECONDS') {
                    input message: "Do you want to apply the changes ?", ok: "yes", submitter: 'i27academy,i27sre'
                }
                echo "Applying terraform infra"
                sh "terraform apply -var-file=${env.TFVARS_FILE} --auto-approve"
            }
        }
        stage ('destroy') {
            when {
                expression {
                    params.ACTION == 'destroy'
                }
            }
            steps {
                timeout (time: 300, unit: 'SECONDS') {
                    input message: "Do you want to Destroy the Infra ?", ok: "yes", submitter: 'i27academy,i27sre'
                }
                echo "Destroying the infra"
                sh "terraform destroy -var-file=${env.TFVARS_FILE} --auto-approve"
            }
        }
    }
    post {
        always {
            echo "***** Cleaning the workspace ******"
            cleanWs()
        }
    }
}


