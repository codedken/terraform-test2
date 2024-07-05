variable "region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "test2"
}

variable "key_name" {
  default = "capstone-key"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.0.0.0/24"
}
variable "subnet2_cidr" {
  default = "10.0.32.0/24"
}
variable "subnet3_cidr" {
  default = "10.0.64.0/24"
}

variable "domain_name" {
  default = "prayandcode.com.ng"
}
