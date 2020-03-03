module "helm_deploy" {
  source = "fuchicorp/chart/helm"


  deployment_name        = "artemis-deployment"
  deployment_environment = "${var.deployment_environment}" 
  deployment_endpoint = "${var.google_domain_name}"
  deployment_path        = "artemis"

  template_custom_vars = {
    deployment_image = "nginx"
  }
}