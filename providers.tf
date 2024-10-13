# providers.tf (if you don't have this file, you can create it)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66"  # Choose a version that works with your platform
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.3"  # Version for the null provider
    }
  }
}
