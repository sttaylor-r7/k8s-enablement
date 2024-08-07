variable "num_instances" {
  description = "The number of instances to create"
  type = number
}

variable "instance_name" {
  description = "The name of the Compute Engine instance"
  type        = string
  default     = "admin-node"
}

variable "machine_type" {
  description = "The machine type for the Compute Engine instance"
  type        = string
  default     = "e2-micro"
}

variable "project" {
  description = "The google cloud project"
  type = string
}

variable "region" {
    description = "Region to deploy resources into"
    type = string
}