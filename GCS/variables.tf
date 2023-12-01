########## COMMON VARIABLES ############
variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
  })
}
variable "bucket" {
  type = map(object({
    name                     = string
    description              = string
    location                 = string
    storage_class            = string
    force_destroy            = bool
    public_access_prevention = string
  }))
}
