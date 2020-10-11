#----networking/variables.tf----
variable "vpc_cidr" {
  type = string
  default = "10.234.0.0/16"
}

variable "public_cidrs" {
  type = list(string)
 default = ["10.234.3.0/24","10.234.4.0/24"]
}

variable "private_cidrs" {
  type = list(string)
  default = ["10.234.1.0/24","10.234.2.0/24"]
}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "user_cidr" {
  default = "10.234.5.0/24"
}

variable "project_name" {
  default = "monitoring"
}

variable "shared_credentials" {
  default = "/home/william/.aws/credentials"
}

variable "profile" {
  default = "default"
}

variable "region" {
  default = "ap-southeast-2"
}
