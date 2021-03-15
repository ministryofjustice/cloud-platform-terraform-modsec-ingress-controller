########
# Helm #
########

resource "helm_release" "modsec_ingress_nginx" {
  name       = var.controller_name
  chart      = "ingress-nginx"
  namespace  = "ingress-controllers"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = "3.6.0"

  values = [templatefile("${path.module}/templates/values.yaml.tpl", {
    controller_name = var.controller_name
    default_cert    = var.default_cert
    replica_count    = var.replica_count
  })]

  depends_on = [
    var.dependence_prometheus,
    var.dependence_certmanager
  ]
}
