pipeline {
    agent any
    stages {
        stage('build docker image') {
            steps {
                sh 'docker build -t ${BUILD_NUMBER} .'
             
                }
        }
        stage('push docker image to ecr') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 024354343612.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker tag ${BUILD_NUMBER}:latest 024354343612.dkr.ecr.us-east-1.amazonaws.com/pythonapp:${BUILD_NUMBER}'     
                sh 'docker push 024354343612.dkr.ecr.us-east-1.amazonaws.com/pythonapp:${BUILD_NUMBER}'
                }
        }
        stage('deployment'){
            steps{
                sh '''
                    cd IaaC
                    terraform init
                    terraform apply -auto-approve \
                    -var-file="values.tfvars"  \
                    -var 'imageURI=024354343612.dkr.ecr.us-east-1.amazonaws.com/pythonapp:'${BUILD_NUMBER}
                   

                '''
            }
        }
    }    
}    
