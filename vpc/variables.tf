variable "main" {
  type = object({
    project = string
    region  = string
  })
}
#################### VPC Variable #######################
variable "networks" {
  type = map(object({
    project_id              = string
    network_name            = string
    routing_mode            = string
    description             = string
    auto_create_subnetworks = bool
    mtu                     = number
  }))
}
#################### Subnet Variables #######################
variable "subnetworks" {
  type = map(object({
    subnet_name              = string
    subnet_ip                = string
    subnet_region            = string
    private_ip_google_access = bool
    network_name             = string
  }))
}
#################### Firewall Variables #######################
variable "firewall_rules" {
  type = map(object({
    name          = string
    direction     = string
    source_ranges = list(string)
    target_tags   = list(string)
    network       = string
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))

  }))
  default = {}
}
