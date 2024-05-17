provider "aws" {
  region = "eu-west-1" # specify your desired region
}
 
# Define the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
 
  tags = {
    Name = "my_vpc"
  }
}
 
# Define the Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
 
  tags = {
    Name = "my_subnet"
  }
}
 
# Define the Security Group
resource "aws_security_group" "joe_allow_ssh_3000" {
  name        = "my_security_group"
  description = "Allow SSH, HTTP, and custom port 3000"
  vpc_id      = aws_vpc.my_vpc.id  # Associate the security group with the VPC
 
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    description = "Allow custom port 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "my_security_group"
  }
}
 

# DO NOT HARDCODE AWS ACCESS KEY OR SECRET KEY
# which service
resource "aws_instance" "app_instance" {

# which ami
       ami = "ami-02f0341ac93c96375"

# t2 micro
       instance_type ="t2.micro"

# assosciate public ip with this address
        associate_public_ip_address = true

# which controller (micro)
        tags = {
             Name = "joeod-terraform-tech258-app"
        }
}

resource "github_repository" "automated_repo" {
  name        = "IaC-github-automated-repo"
  description = "automated terraform repo"
  visibility  = "public"
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "example" {
  name        = "IaC-github-automated-repo"
  description = "This is an example repo created with Terraform"
  visibility  = "public"
}

variable "github_token" {
  description = "The GitHub token for API access"
  type        = string
}
