terraform {
  backend "gcs" {
    bucket = "i27-terraform-bucket"
    prefix  = "terraform/state"
  }
}