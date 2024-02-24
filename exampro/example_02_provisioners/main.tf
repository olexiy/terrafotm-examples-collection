data "aws_vpc" "main" {
  default = true
}

resource "aws_security_group" "sg_my_server" {
  name        = "sg_my_server"
  description = "MyServer Security Group"
  vpc_id      = data.aws_vpc.main.id

  ingress = [{
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["146.60.47.78/32"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    },
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [data.aws_vpc.main.cidr_block]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }

  ]
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDe6fN/SBgmKsURjCRgB5VO4i6fHFye88C8Ju/u2O987aoYBhKHgXntqlOfQrdNt3CoyxSyyuP/1YuMxhZJFEmcZej9ti5q6CTY+u9//+vgbZLz3RchR9Z0Xxl4zrLcbNLYe5E2FPRUr9E5Vjii9dG+8nvGg2kKqhKcOEpSldhyVlMeZ8cXnClKSYbqLaQ9LI+usU5WXvpdIeu48uG9oLLy1fhSZvAvhCTbezSjfhuV+I+mzXf1ZFG8P88JxuRPAZ5eMvqNzSIRN4gFgZgi2UmurIrux7SfdBKP7Vr2JvTHmoDdld/1HLdbBMjGDkagiBYa1jNENdeNnrLxdiZDVRaFuS1zo1IEtf75v3dJDxz0/i9c8wXkWvUq5N7k9N+3xrsXhZlHTOipi/tJQ8rf8Lnh/xNLhhk6SNTKfEkNcx71M/n43h0ONhkWV2gVpsawDyWRc5BJ/8yl0nqLH36CkhhFKbL9hb4YlCf3dd1RCaQgB8O0x0AA4hVgE2g3cZGKmws= olexiy@Olexiys-MBP.fritz.box"
}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0a23a9827c6dab833"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg_my_server.id]
  user_data              = file("userdata.yaml")
  tags = {
    Name = "MyServer"
  }
}