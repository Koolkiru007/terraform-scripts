resource "google_compute_firewall" "firewall_rules" {
  for_each      = var.firewall_rules
  name          = each.value.name //"l4-ilb-fw-allow-ilb-to-backends"
  provider      = google-beta
  direction     = each.value.direction                                                 //"INGRESS"
  network       = "projects/${var.main.project}/global/networks/${each.value.network}" //"projects/${var.project}/global/networks/${var.network}"
  source_ranges = each.value.source_ranges                                             //["10.0.1.0/24"]
  target_tags   = each.value.target_tags                                               //["allow-ssh"]
  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
  depends_on = [
    google_compute_network.network
  ]
}
