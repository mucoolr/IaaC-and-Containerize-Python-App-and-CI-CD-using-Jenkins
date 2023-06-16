## To create and configure a simple CI/CD pipeline using Jenkins

### Components Used.

1) Jenkins
2) Docker
3) Elastic Compute Cloud(EC2)
4) Terraform
5) Elastic Container Service(ECS)
6) Elastic Container Registry(ECR)
7) Load Balancer
8) Github

### Steps Followed to Create CI/CD

1) Launch an EC2 instance .
2) Install and configure Jenkins and Docker on EC2.
3) Create Github public Repository where we update the code.
4) Upload code on Github.
5) On jenkins create a pipeline project
6) In the Build Triggers section of the pipeline configuration , we have enabled poll SCM for every minute so that every minute it will check Git repo if        there is any commit or not , if there is any commit in the repo , the pipeline will get triggered. After the pipeline triggers, the Dockerimage is built with updated code and that docker image is pushed to ecr with jenkins build number as Image Tag.

![alt text](https://github.com/mucoolr/python_app/blob/main/architecture.png)

8) In the Pipeline section , I have configured my public Git repository containing code and Jenkinsfile .
9) I am using Terraform to setup infrastructure .

### Deployment

1) The last stage of pipeline is Deployment .
2) After the image is pushed to ECR, we again run the terraform code , passing new image as argument in terraform apply command which Deploys the latest build of our code to ECS.
