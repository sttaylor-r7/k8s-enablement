output "cluster_names" {
  description = "The names of the created GKE clusters"
  value       = google_container_cluster.lab-clusters[*].name
}