data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "ec2Instance" {
  ami                         = data.aws_ami.amazon_linux.image_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  user_data                   = file(var.user_data_path)
  user_data_replace_on_change = true
  tags = {
    Name = var.instance_name
  }
}