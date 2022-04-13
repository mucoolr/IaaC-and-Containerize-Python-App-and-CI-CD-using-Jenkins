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





