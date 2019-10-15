
provider "google" {
  credentials   = "${file(var.project)}"   #GOOGLE_CREDENTIALS to the path of a file containing the credential JSON
  project       = "${var.project}"
  region        = "${var.region}"
}

resource "google_compute_instance" "bastion" {
  name         = "BastionHost"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
}