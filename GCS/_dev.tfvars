########## COMMON INPUTS ############
main = {
  project = ""
  region  = "europe-west1"
  zone    = "europe-west1-c"
}

########## BUCKET INPUTS ############
bucket = {
  bucket1 = {
    name                     = "name"
    description              = "This bucket is used for storing... source code"
    location                 = "europe-west1"
    storage_class            = "STANDARD"
    force_destroy            = true
    public_access_prevention = "enforced"
  }
}