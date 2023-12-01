main = {
  project = ""
  region  = "us-central1"
}

service_accounts = {
  composer_sa = {
    composer_service_account = "composer-sa"
    display_name             = "This service is using for test composer"
  }
}

composer_env_name                = "test-composer"
service_ip_allocation_range_name = "composer_ip_range"
workloads_config = {
  scheduler = {
    cpu        = 0.5
    memory_gb  = 2
    storage_gb = 1
    count      = 1
  }
  web_server = {
    cpu        = 0.5
    memory_gb  = 2
    storage_gb = 1
  }
  worker = {
    cpu        = 0.5
    memory_gb  = 2
    storage_gb = 1
    min_count  = 1
    max_count  = 3
  }
}
pypi_packages = {
  "jsonschema" = ">=3.1.1"
}



