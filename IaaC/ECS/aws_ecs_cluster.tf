resource "aws_ecs_cluster" "cluster" {
  name = "${var.ecsClusterName}"
  tags = var.tags

#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
}
