locals {
  project_name = "exampro"
}

# Create a new EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0a23a9827c6dab833"
  instance_type = var.instance_type

  tags = {
    Name = "${local.project_name}-instance"
  }
}

