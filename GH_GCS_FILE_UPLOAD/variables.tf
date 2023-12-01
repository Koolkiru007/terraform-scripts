########## COMMON VARIABLES ############
variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
  })
}
variable "bucket_path" {
  type = map(object({
    path   = string
    name   = string
    bucket = string
  }))
}