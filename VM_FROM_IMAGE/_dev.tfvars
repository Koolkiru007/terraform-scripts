########## COMMON INPUTS ############
main = {
  project = ""
  region  = "europe-west1"
  zone    = "europe-west1-c"
}

########## VM_THROUGH_IMAGE INPUTS ############
custom_vm = {
  "image1" = {
    name = "my-test-vm-from-image"
    path = "projects/<project_id>/global/machineImages/test-image"
  }
}