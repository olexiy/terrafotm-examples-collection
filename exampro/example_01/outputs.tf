output "instance_ip_addr" {
  value = aws_instance.example_instance.public_ip
}