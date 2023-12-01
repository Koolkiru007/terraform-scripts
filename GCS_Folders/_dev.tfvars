########## COMMON INPUTS ############
main = {
  project = ""
  region  = "europe-west1"
  zone    = "europe-west1-c"
}

########## BUCKET_FOLDER INPUTS ############
bucket_folder = {
  folder_1 = {
    folder_name = "folder1/subf1/subf2/"
    description = "subfolders under the gcs bucket"
    bucket_name = "name-of-bucket"
  }
}