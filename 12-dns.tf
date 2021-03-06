resource "powerdns_record" "ingress" {
  for_each = toset(flatten(list(var.dns_fqdn)))
  zone     = var.dns_zone
  name     = format("%s.", each.value)
  type     = "A"
  ttl      = var.dns_record_ttl
  records  = [ kubernetes_ingress.ingress.status.0.load_balancer.0.ingress.0.ip ]
}
