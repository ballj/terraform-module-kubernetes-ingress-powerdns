resource "icinga2_host" "host" {
  for_each = var.monitoring_enabled ? toset(flatten(list(var.dns_fqdn))) : []
  hostname      = each.value
  address       = kubernetes_ingress.ingress.status.0.load_balancer.0.ingress.0.ip
  check_command = "http"
  vars = merge({
    http_vhost  = each.value
    http_uri    = var.monitoring_uri
    http_ssl    = var.tls_enabled ? true : false
    http_expect = var.monitoring_expect
  }, var.monitoring_vars)
}
