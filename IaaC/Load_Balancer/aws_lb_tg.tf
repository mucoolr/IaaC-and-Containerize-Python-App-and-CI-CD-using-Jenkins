resource "aws_lb_target_group" "target_group" {
  name        ="${var.ecsClusterName}-tg"   
  port        =  var.port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}
