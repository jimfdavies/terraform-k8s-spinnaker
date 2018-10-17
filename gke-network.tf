resource "google_compute_network" "gke1" {
  name                    = "gke1"
  auto_create_subnetworks = "true"
}
