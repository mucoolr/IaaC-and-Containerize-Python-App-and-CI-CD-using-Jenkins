variable "lBsecurityGroups"{
    description= "security group for load balancer"
}
variable "lBSubnet" {
  description = "subnet for loab balancer"
}

variable "ecsClusterName" {
  description = "cluster name for load balancer target"
}
variable "tags" {
  type = map(string)
  description = "Tags for the ECS and load balancer"
}
variable "port" {
 
  description = "target group port"
}
variable "vpc_id" {
   description = "vpc id"
}