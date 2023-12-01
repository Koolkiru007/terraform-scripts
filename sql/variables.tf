variable "main" {
  type = object({
    project = string
    region  = string
  })
}

variable "sql_servers" {
  type = map(object({
    instance_name                                 = string
    database_version                              = string
    tier                                          = string
    deletion_protection_enabled                   = bool
    deletion_protection                           = bool
    disk_autoresize                               = bool
    disk_autoresize_limit                         = number
    disk_size                                     = number
    disk_type                                     = string
    user_labels                                   = map(string)
    ipv4_enabled                                  = bool
    private_network                               = string
    enable_private_path_for_google_cloud_services = bool
  }))
}

# variable "root_password" {
#   type      = string
#   default   = ""
#   sensitive = true
# }
