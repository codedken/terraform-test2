// Create 3 ubuntu-based instance

resource "aws_instance" "web1" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = aws_subnet.subnet1.id
  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = "${var.project_name}-web1"
  }
}
resource "aws_instance" "web2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = aws_subnet.subnet2.id
  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = "${var.project_name}-web2"
  }
}
resource "aws_instance" "web3" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = aws_subnet.subnet3.id
  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = "${var.project_name}-web3"
  }
}


// Create a host-inventory file and put the public ip address of the instances in it 

resource "local_file" "host_inventory" {
  filename = "ansible-playbook/host-inventory"
  content  = <<-EOT
                ${aws_instance.web1.public_ip}
                ${aws_instance.web2.public_ip}
                ${aws_instance.web3.public_ip}
            EOT
}
