module "grafana_deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "${var.grafana["grafana-name"]}"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "grafana.${var.google_domain_name}"
  deployment_path        = "grafana"

  template_custom_vars = {
    
    
    datasource_dns_endpoint  = "https://prometheus.${var.google_domain_name}"
    grafana_password         = "${var.grafana["grafana_password"]}"
    grafana_username         = "${var.grafana["grafana_username"]}"
    grafana_client_secret    = "${var.grafana["grafana_client_secret"]}"
    grafana_auth_client_id   = "${var.grafana["grafana_auth_client_id"]}"

    smtp_user                = "${var.grafana["smtp_username"]}"
    smtp_password            = "${var.grafana["smtp_password"]}"
    smtp_host                = "${var.grafana["smtp_host"]}"
    
  }
}
