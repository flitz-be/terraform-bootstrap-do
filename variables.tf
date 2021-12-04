variable "state_bucket_name" {
  type    = string
  default = "terraform-state-bucket"
}
variable "state_bucket_region" {
  type    = string
  default = "fra1"
}
variable "do_token" {
  type = string
}
variable "spaces_access_key_id" {
  type = string
}
variable "spaces_secret_key" {
  type = string
}