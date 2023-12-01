########## COMMON VARIABLES ############
variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
  })
}
variable "bucket_folder" {
  type = map(object({
    folder_name = string
    description = string
    bucket_name = string
  }))
}