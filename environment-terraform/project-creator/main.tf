module "project-creator" {
    source = "./modules/project-creator"

    organization_id           = var.organization_id
    billing_account           = var.billing_account
    terraform_service_account = var.terraform_service_account
    folder_id                 = var.folder_id
}

