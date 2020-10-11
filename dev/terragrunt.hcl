remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "egadsthefuzz-dev-terraform-statestore"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "my-lock-table"
  }
}

#terraform {
#  extra_arguments "common_vars" {
#    commands = get_terraform_commands_that_need_vars()
#
#    arguments = [
#      "-var-file=../common.tfvars",
#      "-var-file=../region.tfvars"
#    ]
#  }
#}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
# Set AWS as the provider and establish creds and default region (alias isn't needed here)
provider aws {
  shared_credentials_file = var.shared_credentials
  profile                 = var.profile
  region                  = var.region
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
EOF
}
