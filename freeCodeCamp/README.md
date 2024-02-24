# Terraform on AWS example

Example containing VPS, Security Group and EC2 instance based on free Youtube course  

[Learn Terraform (and AWS) by Building a Dev Environment – Full Course for Beginners](https://www.youtube.com/watch?v=iRaai1IBlB0)

Project create a simple set of AWS resources needed to use a EC2 instance as a workstation

## List of created resources

- VPC
- Subnet
- Internet gateway 
- Route table
- Route
- Route table association
- Security group - for better security set your current IP Address in ingress rule
- Key pair  - public key must be stored in terraform cloud
- EC2 Instance with userdata


Also wie getting AMI id from **aws_ami** data  