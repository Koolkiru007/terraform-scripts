main = {
  project = ""
  region  = "us-central1"
}
#################### VM Inputs #######################
vms = {
  vm1 = {
    name         = "wb-test-vm-1"
    machine_type = "e2-medium"
    zone         = "us-central1-a"
    image        = "debian-cloud/debian-11"
    size         = 50
    tags         = ["dev"]
    labels = {
      "env" = "dev"
    }
    type                      = "pd-standard"
    network                   = "default"
    allow_stopping_for_update = true
  }
  vm2 = {
    name         = "wb-test-vm-2"
    machine_type = "e2-medium"
    zone         = "us-central1-a"
    image        = "debian-cloud/debian-11"
    tags         = ["dev"]
    labels = {
      "env" = "dev"
    }
    size                      = 50
    type                      = "pd-standard"
    network                   = "default"
    allow_stopping_for_update = true
  }
}
