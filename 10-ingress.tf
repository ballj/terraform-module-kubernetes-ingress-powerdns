resource "kubernetes_ingress" "ingress" {
  metadata {
    namespace   = var.namespace
    name        = var.object_prefix
    annotations = merge({
      "kubernetes.io/ingress.class" = var.ingress_class },
      var.tls_enabled ? { format("%s/%s", "cert-manager.io", var.cert_issuer_type) = var.cert_issuer_name } : {},
      var.ingress_annotations
    )
    labels = local.common_labels
  }
  wait_for_load_balancer = true
  spec {
    dynamic "rule" {
    for_each = flatten(list(var.dns_fqdn))
    content {
      host = rule.value
      http {
        path {
          path = "/"
          backend {
            service_name = var.service_name
            service_port = var.service_port
          }
        }
      }
      }
    }
    dynamic "tls" {
      for_each = var.tls_enabled ? [1] : []
      content {
          hosts       = flatten(list(var.dns_fqdn))
          secret_name = kubernetes_secret.ingress[0].metadata[0].name
      }
    }
  }
}
