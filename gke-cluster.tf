resource "google_container_cluster" "spinnaker1" {
  name               = "spinnaker1"
  zone               = "${var.default_zone}"

  initial_node_count  = 1
  additional_zones    = "${var.additional_zones}"

  network = "gke1"

  master_auth {
    username = "${var.master_username}"
    password = "${var.master_password}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

output "client_certificate" {
  value = "${google_container_cluster.spinnaker1.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.spinnaker1.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.spinnaker1.master_auth.0.cluster_ca_certificate}"
}
