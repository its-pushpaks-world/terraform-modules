variable "instance_name" { type = string }
variable "vpc_id"        { type = string }
variable "subnet_id"     { type = string }

variable "instance_type" { 
  type    = string
  default = "t3.micro"
} # standard free tier

variable "user_data" { 
  type    = string
  default = ""
}

resource "aws_security_group" "instance_sg" {
  name   = "${var.instance_name}-sg"
  vpc_id = var.vpc_id

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }     

  # Tomcat
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Grafana
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Mimir
  ingress {
    from_port   = 9009
    to_port     = 9009
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Loki
  ingress {
    from_port   = 3100
    to_port     = 3100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "node" {
  ami                    = "ami-03f4878755434977f" # Ubuntu 22.04 LTS (ap-south-1)
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  user_data              = var.user_data
  tags                   = { Name = var.instance_name }
}

output "private_ip" {
  value = aws_instance.node.private_ip
}

output "public_ip" {
  value = aws_instance.node.public_ip
}
