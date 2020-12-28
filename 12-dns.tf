resource "powerdns_record" "ingress" {
  zone    = var.dns_zone
  name    = format("%s.", var.dns_fqdn)
  type    = "A"
  ttl     = var.dns_record_ttl
  records = [ kubernetes_ingress.ingress.load_balancer_ingress[0].ip ]
}
