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
