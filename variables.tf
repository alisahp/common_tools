variable "deployment_environment" {
  default = "tools"
  description = "Namespace of the deployment <It will be created>"
}

variable "vault_token" {
  description = "Please enter token for Vault."
}

variable "vault_service_port" {
  default     = 8082
  description = "Please do not change this ports."
}

variable "nexus_service_port" {
  default     = 8083
  description = "Please do not change this ports."
}

variable "tiller_version" {
  default     = "v2.11.0"
  description = "Please provide version of the tiller."
}

variable "tiller_namespace" {
  default     = "kube-system"
  description = "Tiller by default will deploy to kube-system"
}

variable "repo_port" {
  default = 8085
}

variable "email" {
  default = "fuchicorpsolutions@gmail.com"
}

variable "google_project_id" {
  default = "angular-unison-267720"
}

variable "jenkins" {
  type = "map"

  default = {
    admin_user             = "admin"
    admin_password         = "password"
    jenkins_auth_client_id = "5cd41c2236404fa72a8e"
    jenkins_auth_secret    = "23744147618db53ef79deb652b53e3a4f07c3c40"
    git_token              = "awdiahwd12ehhaiodd"
  }
}

variable "grafana" {
  type = "map"

  default = {
    grafana-version  = "6.0.1"
    grafana_username = "admin"
    grafana_password = "password"
    grafana-name     = "grafana"
  }
}

variable "google_domain_name" {
  default = "fuchicorp.com"
  description = "Please change to your domain name"
}
