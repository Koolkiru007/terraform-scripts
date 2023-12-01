resource "random_password" "root-password" {
  length  = 8
  special = true
}

resource "google_sql_database_instance" "sql_server" {
  for_each            = var.sql_servers
  project             = var.main.project
  name                = each.value.instance_name
  database_version    = each.value.database_version
  region              = var.main.region
  deletion_protection = each.value.deletion_protection
  root_password       = random_password.root-password.result

  settings {
    tier                        = each.value.tier
    deletion_protection_enabled = each.value.deletion_protection_enabled

    ip_configuration {

      ipv4_enabled                                  = each.value.ipv4_enabled
      private_network                               = each.value.private_network
      enable_private_path_for_google_cloud_services = each.value.enable_private_path_for_google_cloud_services
    }

    disk_autoresize       = each.value.disk_autoresize
    disk_autoresize_limit = each.value.disk_autoresize_limit
    disk_size             = each.value.disk_size
    disk_type             = each.value.disk_type
    user_labels           = each.value.user_labels
  }
}

resource "google_secret_manager_secret" "secret-basic" {
  secret_id = "sql-db-root-wb"
  replication {
    auto {}
  }
}
resource "google_secret_manager_secret_version" "secret-version" {
  secret      = google_secret_manager_secret.secret-basic.id
  secret_data = random_password.root-password.result
  depends_on  = [google_sql_database_instance.sql_server]
}
