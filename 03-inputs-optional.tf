variable "service_port" {
  description = "Port for the ingress"
  default = 80
}

variable "ingress_class" {
  description = "Ingress class to use"
  default     = "traefik"
}

variable "tls_enabled" {
  description = "Ingress class to use"
  type        = bool
  default     = true
}

variable "dns_record_ttl" {
  description = "TTL for DNS records"
  default     = 600
}

variable "cert_issuer_type" {
  description = "Issuer type for cert-manager"
  default = "issuer"
}

variable "cert_issuer_name" {
  description = "Issuer name for cert-manager"
  default     = "self-signed"
}

variable "labels" {
  description = "labels to add to ingress"
  default     = {}
}
