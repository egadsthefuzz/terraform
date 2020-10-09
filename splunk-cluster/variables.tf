variable "subnetCid" {default = "subnet-01f19148ca7fe10d2"}
variable "subnetDid" {default = "subnet-086948100869e06f0"}
variable "subnetAid" {default = "subnet-0ca22b46b40b7d4bb"}
variable "subnetBid" {default = "subnet-055fb672208ffaa3d"}
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
variable "accessip" {
  default = ["103.216.190.94/32"]
}
variable "key_name" { default = "test"}
variable "cloudwatch_retention" {
  default = 30
}
variable "cloudwatch_loggroup_name" { default = "splunk-cloudwatch-log"}
variable "splunk_shc_alb" { default = "shc-alb" }
variable "alb_listener_protocol" { default = "HTTP"}
variable "enable_splunk_shc" {
  description = "If set to true, enable auto scaling"
  type        = bool
  default     = true
}

variable "splunk_shc_volume_size" {default = "20"}
variable "splunk_shc_root_volume_size" {default = "20"}
variable "project_name" { default = "monitoring-splunk"}
variable "license_server_hostname" { default = "ip-10-234-1-239.ap-southeast-2.compute.internal"}
variable "splunkadminpass" { default = "splunkpass"}
variable "splunkshcrepport" { default = "8181"}
variable "splunkshcrepfact" { default = "2"}
variable "shclusterkey" { default = "testcluster" }
variable "pvt_key" { default = "/home/william/.ssh/id_rsa"}
variable "bastion_public_ip" { default = "54.206.230.19"}
variable "ec2-user" {
  default = "ec2-user"
}
variable "shcmemberindex_captain" {
  default = 1
}
variable "asgindex" {
  default = "asgindex"
}
variable "shcmembercount" { default = "2"}
variable "shc_init_check_retry_count" { default = "3"}
variable "shc_init_check_retry_sleep_wait" { default = "15"}
variable "splunkindexer_clusterrepport" { default = "9887"}
variable "indexer_clustermembercount" { default = "2" }
variable "splunk_indexer_cluster_volume_size" { default = "20" }
variable "splunk_indexer_cluster_root_volume_size" { default = "20" }
variable "indexer_clusterkey" { default = "testluster"}
variable "indexer_clusterrepf" { default = "2"}
variable "indexer_clustersf" { default = "2"}
variable "indexer_clusterlabel" { default = "testcluster"}
variable "splunk_ingest_port" { default = "9997"}
variable "environment" { default = "test"}
variable "app" { default = "splunk"}
variable "region" { default = "ap-southeast-2"}

variable "shared_credentials" {
  default = "/home/william/.aws/credentials"
}

variable "profile" {
  default = "default"
}
#variable "data_local_file_public_key" {
#  default = "/home/william/.ssh/id_rsa.pub"
#}

