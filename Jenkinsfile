pipeline {
    agent any
    stages {
        stage(\"build docker image\") {
            steps {
                sh \"docker build -t python-app-${BUILD_NUMBER} .\"
             
                }
        }
        stage(\"push docker image to ecr\") {
            steps {
                sh \"aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 024354343612.dkr.ecr.us-east-1.amazonaws.com\"
                sh \"docker tag python-app-${BUILD_NUMBER}:latest 024354343612.dkr.ecr.us-east-1.amazonaws.com/pythonapp:python-app-${BUILD_NUMBER}\"     
                sh \"docker push 024354343612.dkr.ecr.us-east-1.amazonaws.com/pythonapp:python-app-${BUILD_NUMBER}\"
                }
        }
        stage(\"deployment\"){
            steps{
                sh \"\"\"
                    CLUSTER_ARN=\"arn:aws:ecs:us-east-1:024354343612:cluster/ecs-cluster\"
                    task_definition_name=\"ecs-clusterTask\"
                    service_name=\"ecs-cluster\"
                    NEW_ECR_IMAGE=\"24354343612.dkr.ecr.us-east-1.amazonaws.com/pythonapp:python-app-\"${BUILD_NUMBER}
                    echo $NEW_ECR_IMAGE
                    echo "testing"
                    TASK_DEFINITION=$(aws ecs describe-task-definition --task-definition $task_definition_name)
                    echo $TASK_DEFINITION | jq \".taskDefinition.containerDefinitions[0].image=\"${NEW_ECR_IMAGE}\"\" > task-def.json
                    jq .taskDefinition task-def.json > taskdefinition.json
                    jq \"del(.taskDefinitionArn)\" taskdefinition.json | jq \"del(.revision)\" | jq \"del(.status)\" | jq \"del(.requiresAttributes)\" | jq \"del(.compatibilities)\" | jq \"del(.registeredAt)\"| jq \"del(.registeredBy)\" > container-definition.json
                    aws ecs register-task-definition --family $task_definition_name --cli-input-json file://container-definition.json > registered_task_definition.json
                    TASK_REVISION=$(jq .taskDefinition.revision registered_task_definition.json)
                    echo $TASK_REVISION
                    aws ecs update-service --cluster $CLUSTER_ARN --service $service_name  --task-definition $task_definition_name:$TASK_REVISION --force-new-deployment > updated_service.json
                \"\"\"
            }
        }
    }    
}    
