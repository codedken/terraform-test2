output "first_instance_public_ip" {
  value = aws_instance.web1.public_ip
}
output "second_instance_public_ip" {
  value = aws_instance.web2.public_ip
}
output "third_instance_public_ip" {
  value = aws_instance.web3.public_ip
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "elb_load_balancer_dns_name" {
  value = aws_lb.lb.dns_name
}
