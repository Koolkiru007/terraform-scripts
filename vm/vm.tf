resource "google_compute_instance" "vminstance" {
  for_each     = var.vms
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  tags         = each.value.tags
  boot_disk {
    initialize_params {
      image  = each.value.image
      size   = each.value.size
      type   = each.value.type
      labels = each.value.labels

    }
  }
  network_interface {
    network = each.value.network
  }
  allow_stopping_for_update = each.value.allow_stopping_for_update
}
