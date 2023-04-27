output "instance_ip" {
  value = aws_instance.vm_gitlab_ci.public_ip
}