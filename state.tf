terraform {
  backend "s3" {
    bucket = "cloudlife-remote-file"
    key    = "cloudlife-remote-file/dev-env/terraform.tfstate"
    region = "us-east-1"
  }
}
