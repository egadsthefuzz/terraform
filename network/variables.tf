#----networking/variables.tf----
variable "vpc_cidr" {
  type = string
  default = ""
}

variable "public_cidrs" {
  type = list(string)
  default = ["x.x.x.x","y.y.y.y"]
}

variable "private_cidrs" {
  type = list(string)
  default = ["x.x.x.x","y.y.y.y"]
}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "user_cidr" {
  default = ""
}

variable "project_name" {
  default = ""
}
