/* module "helm_deploy" {
  source = "fuchicorp/chart/helm"

  deployment_name        = "${var.deployment_name}" 
  deployment_environment = "${var.deployment_environment}" 
  deployment_endpoint    = "external-dns.${var.google_domain_name}"
  deployment_path        = "external-dns"


  template_custom_vars = {
    deployment_image = "nginx"    
    google_project      = "${var.google_project}"

  }
}*/


# Reading the  template and  setting terraform values
module "helm_deploy" {
  source  = "fuchicorp/chart/helm"
  version = "0.0.2"
  deployment_name         = "external-dns-deployment"
  deployment_environment  = "${var.deployment_environment}"
  deployment_endpoint     = "${var.google_domain_name}"
  deployment_path         = "external-dns"
  template_custom_vars    = {
    google_project        = "${var.google_project_id}"
  }
}
resource "kubernetes_secret" "external_dns_secret" {
  metadata {
    name      = "google-service-account"
    namespace = "${var.deployment_environment}"
  }
  data = {
    "credentials.json" = "${file("${path.module}/common-service-account.json")}"
  }
  type = "generic"
}



