module "helm_deploy" {
  source = "fuchicorp/chart/helm"

  deployment_name        = "${var.deployment_name}" 
  deployment_environment = "${var.deployment_environment}" 
  deployment_endpoint    = "external-dns.${var.google_domain_name}"
  deployment_path        = "external-dns"


  template_custom_vars = {
    deployment_image = "nginx"    
    google_project_id      = "${var.google_project_id}"

  }
}
