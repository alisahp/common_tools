data "template_file" "success_output" {
  template = "${file("terraform_templates/output.txt")}"

  vars {

    # Jenkins information 
    jenkins_username           = "${var.jenkins["admin_user"]}"
    jenkins_password           = "${var.jenkins["admin_password"]}"

    # Grafana information
    grafana_username           = "${var.grafana["grafana_username"]}"
    grafana_password           = "${var.grafana["grafana_password"]}"

    # Vault information 
    vault_username             = "admin"
    vault_password             = "${var.vault_token}"

    ## Main domain name
    deployment_endpoint        = "${var.google_domain_name}"
  }
}

output "Success" {
  value = "${data.template_file.success_output.rendered}"
}
