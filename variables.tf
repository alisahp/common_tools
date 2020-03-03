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
  default = "common-project-team-3"
}
variable "jenkins" {
  type = "map"
  default = {
    admin_user             = "admin"
    admin_password         = "password"
    jenkins_auth_client_id = "ba7348064ebd25605840"
    jenkins_auth_secret    = "d8d70fcecc0229c36a3acf6b3d37e54155ce6bd3"
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
  default = "burakkarakas.net"
  description = "Please change to your domain name"
}
