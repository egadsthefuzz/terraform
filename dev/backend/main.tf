# This is the initial backend config for this s3 backend which is where you need to do that essential procedure below to set


# you cannot create a new backend by simply defining this and then
# immediately proceeding to "terraform apply". The S3 backend must
# be bootstrapped according to the simple yet essential procedure in
# https://github.com/cloudposse/terraform-aws-tfstate-backend#usage
module terraform_state_backend {
  source     = "git::https://github.com/egadsthefuzz/terraform-aws-tfstate-backend.git?ref=safety-changes"
  namespace  = "egadsthefuzz"
  stage      = "dev"
  name       = "terraform"
  attributes = ["statestore"]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.backup"
  force_destroy                      = false
}

# Set AWS as the provider and establish creds and default region (alias isn't needed here)
provider aws {
#  alias = "backend_aws"
  shared_credentials_file = var.backend_shared_credentials
  profile                 = var.backend_profile
  region                  = var.backend_region
}

variable "backend_shared_credentials" {
  default = "/home/william/.aws/credentials"
}

variable "backend_profile" {
  default = "default"
}
# AWS region
variable "backend_region" {
  default = "ap-southeast-2"
}
