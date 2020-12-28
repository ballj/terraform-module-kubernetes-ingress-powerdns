terraform {
  required_version = ">= 0.12.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.13.1"
    }
    powerdns   = {
      source  = "terraform-providers/powerdns"
      version = "~>1.3"
    }
  }
}