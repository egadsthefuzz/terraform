# put these in from run of network section
variable "subnetAid" {}
variable "subnetBid" {}
variable "subnetCid" {}
variable "subnetDid" {}
variable "subnetUid" {}
variable "subnetACIDR" {
  default = "x.x.x.x/x"
}
variable "subnetBCIDR" {
  default = "x.x.x.x/x"
}
variable "subnetCCIDR" {
  default = "x.x.x.x/x"
}
variable "subnetDCIDR" {
  default = "x.x.x.x/x"
}
variable "subnetUCIDR" {
  default = "x.x.x.x/x"
}
variable "splunk-ami" {
  default = "ami-xyz"
}
variable "splunk_instance_type" {
  default = "t3.micro"
}
# variable "vpc_id" {}
variable "splunk_web_port" {
  default = "1234" 
}
variable "splunk_mgmt_port" {
  default = "1234"
}
variable "key_name" {
  default = "put-a-key-in-here"
}
# variable "splunk_license_bucket" {}
variable "splunk_license_file" {
  default = "splunk.lic"
}
variable "project_name" {
  default = "monitoring"
}
variable "splunk_splunk_landing" {
  default = "default-landing-here-i-guess"
}
variable "ec2_ami" {
  default = "ami-ubuntu-id-here"
}
variable "bastion_instance_type" {
  default = "t3.micro" 
}
variable "accessip" {
  default = "1.2.3.4"
}
variable "splunk_license_file_path" {}
variable "bastion_windows_name" {}
variable "spot_price" {}
variable "endpoint_service_name" {}
#output from network tf
variable "splunk_private_route_table_id" {}
variable "splunk_license_master_key" {}
variable "ec2_user" {}
variable "bastion_user" {}
variable "bastion_key" {}
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
  default = "put/bucket/address/in/here
}
