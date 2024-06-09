terraform {
 backend "gcs" {
   bucket                      = "terraform_dalla_backend_12012024"
   prefix                      = "terraform-project-infrastructure" 
 }
}