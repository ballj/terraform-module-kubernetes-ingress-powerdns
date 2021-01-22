terraform {
  required_version = ">= 0.12.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
    powerdns   = {
      source  = "pan-net/powerdns"
      version = ">= 1.3"
    }
  }
}
