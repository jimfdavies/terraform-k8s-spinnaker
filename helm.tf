# provider "helm" {
#   kubernetes {
#       host     = "${google_container_cluster.spinnaker1.endpoint}"
#       username = "${var.master_username}"
#       password = "${var.master_password}"
#
#       client_certificate     = "${google_container_cluster.spinnaker1.master_auth.0.client_certificate}"
#       client_key             = "${google_container_cluster.spinnaker1.master_auth.0.client_key}"
#       cluster_ca_certificate = "${google_container_cluster.spinnaker1.master_auth.0.cluster_ca_certificate}"
#   }
# }
#
# resource "helm_release" "spinnaker" {
#   name = "spinnaker"
#   chart = "stable/spinnaker"
# }
