variable "project_id" {}
variable "region" {
  default = "us-central1"
}
variable "cluster_name" {}
variable "credentials_file" {}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_container_cluster" "autopilot" {
  name              = var.cluster_name
  location          = var.region
  enable_autopilot  = true
}