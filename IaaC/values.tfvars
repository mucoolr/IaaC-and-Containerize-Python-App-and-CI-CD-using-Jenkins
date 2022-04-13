region             = "us-east-1"
ecsClusterName     = "ecs-cluster"
tags               = { "Purpose" : "staging" ,"Owner":"ashish","Project":"metaportal"}
name_ecs_service   = "ecs-service"
taskDesiredCount   = 1
cpu                = 512
memory             = 1024
container_name     = "python-container"
containerPort      = 5000
vpc_id             ="vpc-0d9c7e1c98b9614d3"
ecs_subnets        =["subnet-049306810a729b9de","subnet-061609cf8368fba31"] 
lBSubnet           =["subnet-049306810a729b9de","subnet-061609cf8368fba31"] 
lBsecurityGroups   =["sg-0776900367ea95a7d"]
lbport             =80








