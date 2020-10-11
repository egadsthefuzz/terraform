# put these in from run of network section
variable "subnetCid" {default = "subnet-01f19148ca7fe10d2"}
variable "subnetDid" {default = "subnet-086948100869e06f0"}
variable "subnetAid" {default = "subnet-0ca22b46b40b7d4bb"}
variable "subnetBid" {default = "subnet-055fb672208ffaa3d"}
variable "subnetUid" {default = "subnet-0ddfa12c2972cc2c1"}
variable "subnetACIDR" {
  default = "10.234.1.0/24"
}
variable "subnetBCIDR" {
  default = "10.234.2.0/24"
}
variable "subnetCCIDR" {
  default = "10.234.3.0/24"
}
variable "subnetDCIDR" {
  default = "10.234.4.0/24"
}
variable "subnetUCIDR" {
  default = "10.234.5.0/24"
}
variable "splunk-ami" {
  default = "ami-03a8b41a8cb90e199"
}
variable "splunk_instance_type" {
  default = "t3.micro"
}
variable "vpc_id" {default = "vpc-04f326820042e609d" }
variable "splunk_web_port" {
  default = "8000" 
}
variable "splunk_mgmt_port" {
  default = "8089"
}
variable "splunk_license_bucket" { default = "test-splunklic" }
variable "splunk_license_file" {
  default = "Splunk.License"
}
variable "project_name" {
  default = "monitoring"
}
variable "s3_objects_bucket" {
  default = "splunk-s3-objects-bucket"
}
variable "ec2_ami" {
  default = "ami-0650cf37ced9a2e0f"
}
variable "bastion_instance_type" {
  default = "t3.micro" 
}
variable "accessip" {
  default = ["103.216.190.94/32"]
}
variable "splunk_license_file_path" { default = "/"}
variable "bastion_windows_name" { default = "windows" }
variable "spot_price" { default = "0.03" }
variable "endpoint_service_name" { default = "com.amazonaws.ap-southeast-2.s3"}
#output from network tf
variable "splunk_private_route_table_id" { default = "rtb-0b8a9e7ec7604e11b"}
variable "splunk_license_master_key" { default = "key" }
variable "ec2_user" { default = "ubuntu"}
variable "bastion_user" { default = "ubuntu"}
# replace this with a lookup to vault
variable "splunk_admin_pass" {
  default = "splunkpass"
}
variable "enable_nat_instance" {
  type = bool
  default = "true"
}
variable "environment" {
  default = "test"
}
variable "app" {
  default = "splunk"
}
variable "splunk_app_deploy_bucket" {
  default = "splunk-app-deploy"
}
variable "data_local_file_public_key" {
  default = "/home/william/.ssh/id_rsa.pub"
}

