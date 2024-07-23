data "google_compute_network" "default" {
  name = "vpc-network"
}

resource "google_container_cluster" "lab-clusters" {
  name     = "kubernetes-1"
  location = "europe-west1"
  network    = data.google_compute_network.default.name
 
  # Enabling Autopilot for this cluster
  enable_autopilot = true
  deletion_protection = false
  
  release_channel {
    channel = "REGULAR"
  }

}
