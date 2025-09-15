resource "aws_security_group" "application" {
  name = "${var.project_name}-app-security-group"
  description = "Security group for application instances"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = [22, 80, 443, 8080, 5000]
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-security-group"
  }
}