# resource "google_compute_network" "network" {
#   name                    = var.network
#   auto_create_subnetworks = false
# }

# resource "google_compute_subnetwork" "subnetwork" {
#   name          = var.subnetwork
#   ip_cidr_range = var.subnet_ip_cidr_range
#   region        = var.region
#   network       = google_compute_network.network.id
# }