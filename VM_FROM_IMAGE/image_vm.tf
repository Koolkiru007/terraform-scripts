resource "google_compute_instance_from_machine_image" "tpl" {
  for_each             = var.custom_vm
  provider             = google-beta
  name                 = each.value.name
  zone                 = var.main.zone
  source_machine_image = each.value.path
}