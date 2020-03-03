
# Reading the  template and  setting terraform values
data "template_file" "external_dns_values" {
  template = "${file("helm-external-dns/external-dns/template_values.yaml")}"

  vars {
    deployment_endpoint = "${var.google_domain_name}"
    google_project   = "${var.google_project_id}"
  }
}

# Generating the values.yaml file to do deplopyment
resource "local_file" "external_dns_helm_chart_values" {
  content  = "${trimspace(data.template_file.external_dns_values.rendered)}"
  filename = "helm-external-dns/.cache/external_dns_values.yaml"
}


## Deploy external_dns controller
resource "helm_release" "external_dns_controller" {
  depends_on = [
    "kubernetes_namespace.service_tools",
    "kubernetes_service_account.tiller",
    "kubernetes_secret.tiller",
    "kubernetes_cluster_role_binding.tiller_cluster_rule"
  ]
  values = [
    "${data.template_file.external_dns_values.rendered}"
  ]
  name      = "external-dns"
  chart     = "./helm-external-dns/external-dns"
  namespace = "${var.deployment_environment}"
}


# External DNS needs secret serviceAccountSecret: "common-service-account"
resource "kubernetes_secret" "external_dns_secret" {
  metadata {
    name      = "google-service-account"
    namespace = "${var.deployment_environment}"
  }

  data = {
    "credentials.json" = "${file("${path.module}/fuchicorp-service-account.json")}"
  }

  type = "generic"
}
