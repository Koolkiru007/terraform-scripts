resource "google_service_account" "service_account" {
  for_each     = var.service_accounts
  account_id   = each.value.composer_service_account
  display_name = each.value.display_name
}

resource "google_project_iam_member" "composer-worker" {
  for_each = toset([
    "roles/composer.worker",
    "roles/bigquery.dataEditor",
    "roles/bigquery.jobUser",
    "roles/secretmanager.admin"
  ])
  project = var.main.project
  role    = each.key
  member  = "serviceAccount:${google_service_account.service_account["composer_sa"].email}"
}
