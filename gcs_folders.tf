resource "google_storage_bucket_object" "content_folder" {
  for_each = var.bucket_folder
  name     = each.value.folder_name
  content  = each.value.description
  bucket   = each.value.bucket_name

  depends_on = [
    google_storage_bucket.gcs_bucket
  ]
}