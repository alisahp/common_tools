terraform {
  backend "gcs" {
    bucket  = "mybestsea"
    prefix  = "tools/commontools"
    project = "mybestsea"
    }
 }
