module "jenkins_deploy" {
  source = "fuchicorp/chart/helm"

  deployment_name        = "jenkins-deployment"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "jenkins.${var.google_domain_name}"
  deployment_path        = "jenkins"

  template_custom_vars = {
    jenkins_user           = "${var.jenkins["admin_user"]}"
    jenkins_pass           = "${var.jenkins["admin_password"]}"
    jenkins_auth_secret    = "${var.jenkins["jenkins_auth_secret"]}"
    jenkins_auth_client_id = "${var.jenkins["jenkins_auth_client_id"]}"
    git_token              = "${var.jenkins["git_token"]}"
  }
}