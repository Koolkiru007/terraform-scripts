resource "google_storage_bucket_object" "gcs_object" {
  for_each     = var.bucket_path
  name         = each.value.name
  source       = each.value.path
  content_type = "text/plain"
  bucket       = each.value.bucket
}