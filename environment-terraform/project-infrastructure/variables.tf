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
}
