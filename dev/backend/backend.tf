# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    encrypt        = true
    key            = "backend/terraform.tfstate"
    region         = "ap-southeast-2"
    bucket         = "egadsthefuzz-dev-terraform-statestore"
    dynamodb_table = "my-lock-table"
  }
}
