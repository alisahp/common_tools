terraform {
  backend "gcs" {
    bucket  = "mybestsea2"
    prefix  = "tools/commontools"
    project = "mybestsea2"
    }
 }
