output "instance_id" {
  value = aws_instance.ec2Instance.id
}

output "instance_public_ip" {
  value = aws_instance.ec2Instance.public_ip
}