module "admin-node" {
    project = var.project
    num_instances = var.num-environments
    source = "./modules/admin-node"
}

module "gke-cluster" {
    source = "./modules/gke-cluster"
}
