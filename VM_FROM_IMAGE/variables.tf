########## COMMON VARIABLES ############
variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
  })
}
variable "custom_vm" {
  type = map(object({
    name = string
    path = string
  }))
}