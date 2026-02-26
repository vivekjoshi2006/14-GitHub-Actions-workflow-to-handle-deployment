resource "aws_security_group" "strapi_sg" {
  name        = "strapi_sg_final_v6" # Unique name to avoid duplicate error
  description = "Allow inbound traffic for Strapi"

  # SSH Access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
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

resource "aws_instance" "strapi_server" {
  ami           = "ami-0c7217cdde317cfec" 
  instance_type = "t2.micro"              
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo docker pull ${var.docker_image}
              sudo docker run -d -p 1337:1337 --name strapi-app ${var.docker_image}
              EOF

  tags = {
    Name = "Strapi-Server-Vivek"
  }
}

output "ec2_public_ip" {
  value = aws_instance.strapi_server.public_ip
}

output "strapi_url" {
  value = "http://${aws_instance.strapi_server.public_ip}:1337"
}

output "strapi_admin_url" {
  value = "http://${aws_instance.strapi_server.public_ip}:1337/admin"
}
