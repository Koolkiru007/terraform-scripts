main = {
  project = ""
  region  = "us-central1"
}


sql_servers = {
  "sql_server1" = {
    instance_name                                 = "sql-db-test-tf"
    database_version                              = "SQLSERVER_2019_STANDARD"
    tier                                          = "db-custom-2-8192"
    deletion_protection_enabled                   = false
    deletion_protection                           = false
    disk_autoresize                               = true
    disk_autoresize_limit                         = 100
    disk_size                                     = 50
    disk_type                                     = "PD_SSD"
    user_labels                                   = { "env" = "dev" }
    ipv4_enabled                                  = false
    private_network                               = "projects/<project_id>/global/networks/test-vpc-for-test"
    enable_private_path_for_google_cloud_services = false
  }
}
