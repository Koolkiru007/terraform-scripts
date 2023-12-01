resource "google_compute_network" "network" {
  for_each                = var.networks
  name                    = each.value.network_name
  auto_create_subnetworks = each.value.auto_create_subnetworks
  routing_mode            = each.value.routing_mode
  project                 = each.value.project_id
  description             = each.value.description
  mtu                     = each.value.mtu
}

resource "google_compute_subnetwork" "subnetwork" {
  for_each                 = var.subnetworks
  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_ip
  region                   = each.value.subnet_region
  private_ip_google_access = each.value.private_ip_google_access
  network                  = each.value.network_name
  depends_on = [
    google_compute_network.network
  ]
}


