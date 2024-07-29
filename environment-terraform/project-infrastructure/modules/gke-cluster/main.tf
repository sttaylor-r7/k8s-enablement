data "google_compute_network" "default" {
  name = "vpc-network"
}

resource "google_container_cluster" "lab-clusters" {
  name     = "kubernetes-1"
  location = var.region
  network    = data.google_compute_network.default.name
 
  # Enabling Autopilot for this cluster
  enable_autopilot = true
  deletion_protection = false
  
  release_channel {
    channel = "REGULAR"
  }

  private_cluster_config {
    enable_private_nodes = "true"
    enable_private_endpoint = "true" 
    master_ipv4_cidr_block = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.0/8"
      display_name = "Internal"
    }
  }
}
