module "admin-node" {
    num_instances = var.num-environments
    source = "./modules/admin-node"
}

module "gke-cluster" {
    num_clusters = var.num-environments
    source = "./modules/gke-cluster"
}