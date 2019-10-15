variable "grafana_password"  {
  default = "Redhat"
}

variable "grafana_username"  {
  default = "grafuser"
}

variable "namespace"  {
  default = "tools"
}

variable "vault_token"  {
  default = "Redhat"
}

variable "mysql_password"  {
  default = "Redhat"
}

variable "grafana_service_port"     {
  default = 8080
  description = "Please do not change this ports."
}

variable "jenkins_service_port"     {
  default = 8081
  description = "Please do not change this ports."
}

variable "vault_service_port"  {
  default = 8082
  description = "Please do not change this ports."
}

variable "nexus_service_port"  {
  default = 8083
  description = "Please do not change this ports."
}


variable "tiller_version"  {
  default = "v2.11.0"
  description = "Please provide version of the tiller."
}

variable "tiller_namespace"  {
  default = "kube-system"
  description = "Tiller by default will deploy to kube-system"
}

variable "repo_port"  {
  default = 8085
}

variable "email"  {
  default = "fuchicorpsolutions@gmail.com"
}

variable "project"  {
  default = "fuchicorp-project"
}


variable "jenkins"  {
  type = "map"
}

variable "machine_type" {
  default = "g1-small"
}

variable "zone" {
  default = "us-central1-a"
}

variable "region" {
  default = "us-central1"
}
