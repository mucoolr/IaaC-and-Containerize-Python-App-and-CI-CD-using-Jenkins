module "Load_Balancer" {
  source           = "./Load_Balancer"
  lBsecurityGroups = var.lBsecurityGroups
  lBSubnet         = var.lBSubnet
  ecsClusterName   = var.ecsClusterName
  tags             = var.tags
  port             = var.lbport
  vpc_id = var.vpc_id


}
module "ECS" {
  source           = "./ECS"
  subnets          = var.ecs_subnets
  ecsClusterName   = var.ecsClusterName
  name_ecs_service = var.name_ecs_service
  taskDesiredCount = var.taskDesiredCount
  imageURI         = var.imageURI
  cpu              = var.cpu
  tgARN            = module.Load_Balancer.tgARN
  memory           = var.memory
  container_name   = var.container_name
  containerPort    = var.containerPort
  tags             = var.tags
  vpc_id           = var.vpc_id

}

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "metamundo-staging"
#   cidr = "10.0.0.0/16"

#   azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }



