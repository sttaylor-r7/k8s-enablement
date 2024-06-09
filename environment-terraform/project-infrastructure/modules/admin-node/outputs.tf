output "instance_name" {
  description = "The name's of the Compute Engine instance"
  value       = google_compute_instance.vm[*].name
}

output "instance_public_ip" {
  description = "The public IP address of the Compute Engine instance"
  value       = google_compute_address.vm_static_ip[*].address
}

output "user_password" {
  description = "The password our k8s-guru account is given"
  value       = random_password.user_password.result
}
