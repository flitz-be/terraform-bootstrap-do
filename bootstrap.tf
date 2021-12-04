terraform {
  required_version = ">=1.0.11"
  backend "s3" {
    endpoint                    = "fra1.digitaloceanspaces.com"
    bucket                      = "terraform-state-bucket"
    key                         = "terraform.tfstate"
    region                      = "eu-central-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }

}
provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.spaces_access_key_id
  spaces_secret_key = var.spaces_secret_key
}

# Build an S3 bucket to store TF state
resource "digitalocean_spaces_bucket" "state_bucket" {
  name   = var.state_bucket_name
  region = var.state_bucket_region

  # Tells the provider to keep a version history of the state file
  versioning {
    enabled = true
  }
}