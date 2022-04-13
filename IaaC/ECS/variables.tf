variable "taskDesiredCount" {
  description = "Number of Task desired to run"
}

variable "subnets" {
  type = list(string)
  description = "List of Subnets to be used"
}
variable "name_ecs_service"{
  description= "name of service"
}
variable "container_name"{
  description= "name of container"
}

variable "ecsClusterName"{
 description = "Name of ECS cluster that is created"  
}
variable "imageURI" {
  description = "URI of image for execution"
}
variable "cpu" {
  description = "Amount of CPU to be given to one Task"
}
variable "memory" {
  description = "Amount of memory to be given to one Task"
}

variable "containerPort" {
  description = "Port on which your application would be running"
}

variable "tags" {
    type = map(string)
  description = "Tags for the applications"
}
variable "tgARN" {
    
  description = "target group arn"
}
variable "vpc_id" {
  description = "vpc id "
}