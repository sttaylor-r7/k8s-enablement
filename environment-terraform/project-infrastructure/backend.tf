terraform {
 backend "gcs" {
   bucket                      = "terraform-divvysales-23072024"
   prefix                      = "terraform-project-infrastructure" 
 }
}
