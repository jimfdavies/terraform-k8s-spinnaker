variable "project" {}
variable "region" {
  default = "europe-west2"
}
variable "default_zone" {
  default = "europe-west2-a"
}
variable "additional_zones" {
  default = [
    "europe-west2-b",
    "europe-west2-c"
  ]
}
variable "master_username" {
  default = "paul.simon"
}
variable "master_password" {
  default = "hello-darkness-my-old-friend"
}
