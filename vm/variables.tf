variable "main" {
  type = object({
    project = string
    region  = string
  })
}
#################### VM Variable #######################
variable "vms" {
  type = map(object({
    name                      = string
    machine_type              = string
    zone                      = string
    tags                      = list(string)
    image                     = string
    size                      = number
    labels                    = map(string)
    type                      = string
    network                   = string
    allow_stopping_for_update = bool
  }))
}

