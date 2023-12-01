variable "main" {
  type = object({
    project = string
    region  = string
  })
}

variable "composer_env_name" {
  description = "Name of Cloud Composer Environment."
  type        = string
}

variable "service_accounts" {
  type = map(object({
    composer_service_account = string
    display_name             = string
  }))
}

variable "service_ip_allocation_range_name" {
  type        = string
  description = "The name of the services' secondary range used to allocate IP addresses to the cluster."
}

variable "machine_type" {
  type        = string
  description = "The Google Compute Engine machine type used for cluster instances."
  default     = "n1-standard-1"
}

variable "image_version" {
  type        = string
  description = "The image version to use in the created environment. Image version value includes Composer version and Airflow version."
  default     = "composer-2-airflow-2"
}

variable "pypi_packages" {
  type        = map(string)
  description = "Custom Python Package Index (PyPI) packages to be installed in the environment."
}

variable "subnet_ip_cidr_range" {
  type        = string
  description = "IP CIDR range for the composer subnet."
  default     = "10.2.0.0/16"
}

variable "environment_size" {
  type        = string
  description = "Environment size."
  default     = "ENVIRONMENT_SIZE_SMALL"
}

variable "workloads_config" {
  type = object({
    scheduler = object({
      cpu        = number
      memory_gb  = number
      storage_gb = number
      count      = number
    })
    web_server = object({
      cpu        = number
      memory_gb  = number
      storage_gb = number
    })
    worker = object({
      cpu        = number
      memory_gb  = number
      storage_gb = number
      min_count  = number
      max_count  = number
    })
  })
}
