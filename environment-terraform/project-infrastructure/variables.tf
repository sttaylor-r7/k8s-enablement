variable "terraform_service_account" {
    description = "SA with privileges to create resources"
    type = string
}

variable "region" {
    description = "Region to deploy resources into"
    type = string
}

variable "project" {
    description = "Name of project to deploy resources into"
    type = string
}

variable "num-environments" {
    description = "Number of environments to create"
    type = number
    default = 1
}
