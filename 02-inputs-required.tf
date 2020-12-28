variable "object_prefix" {
  description = "Unique name to prefix all objects with"
}

variable "dns_fqdn" {
  description = "DNS FQDN of the application"
}

variable "dns_zone" {
  description = "DNS Zone name of the application"
}

variable "namespace" {
  description = "Environment that the application will be deployed in"
}

variable "service_name" {
  description = "Service to target"
}
