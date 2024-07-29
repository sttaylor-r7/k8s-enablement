module "admin-node" {
    project = var.project
    region  = var.region
    num_instances = var.num-environments
    source = "./modules/admin-node"
}

module "gke-cluster" {
    region = var.region
    source = "./modules/gke-cluster"
}
