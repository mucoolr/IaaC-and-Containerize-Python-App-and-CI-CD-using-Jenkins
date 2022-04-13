variable "lBsecurityGroups" {
  description = "lBsecurityGroups "
}
variable "lBSubnet" {
  description = "load balancer subnet "
}
variable "vpc_id" {
  description = "vpc id "
}
variable "ecsClusterName" {
  description = "ECS cluster name"
}
variable "lbport"{
  description = "load balancer target group port"
}
variable "ecs_subnets" {
  description = "ECS subnet"
}
variable "name_ecs_service" {
  description = "ecs service name"
}
variable "taskDesiredCount" {
  description = "No. of tasks"
}
variable "imageURI" {
  description = "image uri to be defined in ecs"
}
variable "cpu" {
  description = "CPU"
}
variable "memory" {
  description = "memory"
}

variable "container_name" {
  description = "container name"
}
variable "containerPort" {
  description = "container port"
}

variable "tags" {
  description = "tag for cluster"
} 