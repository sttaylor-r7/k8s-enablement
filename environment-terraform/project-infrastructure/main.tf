module "admin-node" {
    project = var.project
    num_instances = var.num-environments
    source = "./modules/admin-node"
}

module "gke-cluster" {
    region = var.region
    source = "./modules/gke-cluster"
}
