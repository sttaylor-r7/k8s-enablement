data "google_compute_network" "default" {
  name = "default"
}

resource "google_container_cluster" "lab-clusters" {
  count = var.num_clusters
  name     = "kubernetes-${count.index + 1}"
 
  network    = data.google_compute_network.default.name
 
  # Enabling Autopilot for this cluster
  enable_autopilot = true
  deletion_protection = false
  
  release_channel {
    channel = "REGULAR"
  }
}