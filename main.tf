provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
  zone        = "${var.default_zone}"
}
