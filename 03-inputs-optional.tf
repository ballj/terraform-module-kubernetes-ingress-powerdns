variable "service_port" {
  description = "Port for the ingress"
  default = 80
}

variable "ingress_class" {
  description = "Ingress class to use"
  default     = "traefik"
}

variable "ingress_annotations" {
  description = "Annotations to add to ingress"
  default     = {}
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

variable "monitoring_enabled" {
  description = "Enable monitoring for the service"
  type        = bool
  default     = true
}

variable "monitoring_uri" {
  description = "The request URI for GET or POST"
  default     = "/"
}

variable "monitoring_expect" {
  description = "Comma-delimited list of strings, at least one of them is expected in the first (status) line of the server response"
  default     = "200 OK"
}

variable "monitoring_vars" {
  description = "List of additional vars to pass to monitoring"
  default     = {}
}
