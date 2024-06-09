variable "organization_id" {
    description = "The org ID to create the project in"
    type = string
}

variable "billing_account" {
    description = "The billing account to associate with the project"
    type = string
}

variable "terraform_service_account" {
    description = "SA with privileges to create projects and resources"
    type = string
}

variable "folder_id" {
    description = "Folder new projects should be created in"
    type = string
}