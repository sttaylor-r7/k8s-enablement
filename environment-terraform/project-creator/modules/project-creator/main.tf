resource "random_id" "project_id" {
  byte_length = 4
}

resource "google_project" "demo_project" {
  name       = "k8s-enablement-${random_id.project_id.hex}"
  project_id = "k8s-enablement-${random_id.project_id.hex}"
  folder_id  = var.folder_id
  billing_account = var.billing_account
}

resource "google_project_service" "compute" {
  project = google_project.demo_project.id
  service = "compute.googleapis.com"
}

resource "google_project_service" "cloudresourcemanager" {
  project = google_project.demo_project.id
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "iam" {
  project = google_project.demo_project.id
  service = "iam.googleapis.com"  
}

resource "google_project_service" "storage" {
  project = google_project.demo_project.id
  service = "storage-component.googleapis.com"
}

resource "google_project_service" "container" {
  project = google_project.demo_project.id
  service = "container.googleapis.com"  
}