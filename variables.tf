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
  default = "commonteamfour"
}

variable "jenkins" {
  type = "map"

  default = {
    admin_user             = "admin"
    admin_password         = "password"
    jenkins_auth_client_id = "c4a47e4cc6e2c0b5ef07"
    jenkins_auth_secret    = "1c9bac1edf0ab85506cb828d338d8a3fef6a922b"
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
