data "google_secret_manager_secret_version_access" "airflow-config-smtp-password" {
  secret = "airflow-config-smtp-password" // use this block if you want to take any secrets from gcp (optional)
}
resource "google_composer_environment" "composer_env" {
  name    = var.composer_env_name
  region  = var.main.region
  project = var.main.project
  config {
    software_config {
      image_version = var.image_version
      pypi_packages = var.pypi_packages
      env_variables = {
        smtp_password = data.google_secret_manager_secret_version_access.airflow-config-smtp-password.secret_data
      }
      airflow_config_overrides = {
        secrets-backend           = "airflow.providers.google.cloud.secrets.secret_manager.CloudSecretManagerBackend"
        secrets-backend_kwargs    = jsonencode({ "project_id" : "<projectid>", "connections_prefix" : "airflow-connections", "variables_prefix" : "airflow-config", "sep" : "-" })
        smtp-smtp_port            = "587"
        smtp-smtp_mail_from       = "no-reply-reports@tst-gnt.wildbrain.com"
        smtp-smtp_host            = "email-smtp.us-east-1.amazonaws.com"
        smtp-smtp_starttls        = "True"
        smtp-smtp_ssl             = "False"
        smtp-smtp_password_secret = "smtp-password"
        smtp-smtp_user            = google_secret_manager_secret_version_access.airflow-config-smtp-password.secret.secret_data //AKIA3YAW535HRIHES75R"
        email-email_backend       = "airflow.utils.email.send_email_smtp"
      }
    }

    workloads_config {
      scheduler {
        cpu        = var.workloads_config.scheduler.cpu
        memory_gb  = var.workloads_config.scheduler.memory_gb
        storage_gb = var.workloads_config.scheduler.storage_gb
        count      = var.workloads_config.scheduler.count
      }
      web_server {
        cpu        = var.workloads_config.web_server.cpu
        memory_gb  = var.workloads_config.web_server.memory_gb
        storage_gb = var.workloads_config.web_server.storage_gb
      }
      worker {
        cpu        = var.workloads_config.worker.cpu
        memory_gb  = var.workloads_config.worker.memory_gb
        storage_gb = var.workloads_config.worker.storage_gb
        min_count  = var.workloads_config.worker.min_count
        max_count  = var.workloads_config.worker.max_count
      }

    }
    environment_size = var.environment_size

    node_config {
      network         = "projects/<project_id>/global/networks/test-vpc-for-sql"
      subnetwork      = "projects/<project_id>/regions/us-central1/subnetworks/test-vpc-for-sql"
      service_account = google_service_account.service_account["composer_sa"].email
    }
  }
}
