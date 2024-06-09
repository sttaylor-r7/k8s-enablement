output "admin_node_ips" {
  description = "The public IP address of the Compute Engine instance"
  value       = module.admin-node[*].instance_public_ip
}

output "admin_node_password" {
    sensitive = true
    description = "The admin node password"
    value       = module.admin-node.user_password
}

output "gke_cluster_names" {
    description = "The names of our kubernetes clusters"
    value       = module.gke-cluster[*].cluster_names
}

