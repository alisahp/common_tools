## Before deploy ingress for each services it will make sure all services available
module "ingress_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "ingress"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "${var.google_domain_name}"
  deployment_path        = "main-helm"

  template_custom_vars = {
    
    nexusport = "${var.nexus_service_port}"
    vaultport = "${var.vault_service_port}"
    repo_port = "${var.repo_port}"
    email     = "${var.email}"
    domain_name = "${var.google_domain_name}"
  }
}


