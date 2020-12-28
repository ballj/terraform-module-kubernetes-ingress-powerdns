resource "kubernetes_secret" "ingress" {
  count = var.tls_enabled ? 1 : 0
  metadata {
    namespace   = var.namespace
    name        = format("%s-%s", var.object_prefix, "tls")
    labels = merge(var.labels, local.common_labels)
  }
  lifecycle {
    ignore_changes = [ metadata[0].annotations, data ]
  }
  provisioner "local-exec" {
    when    = destroy
    command = "sleep 2"
  }
}
