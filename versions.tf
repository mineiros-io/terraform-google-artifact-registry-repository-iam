terraform {
  required_version = ">= 0.14, < 2.0"

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.75, < 5.0"
    }
  }
}
