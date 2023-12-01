########## COMMON INPUTS ############
main = {
  project = ""
  region  = "europe-west1"
  zone    = "europe-west1-c"
}

########## FILE UPLOAD TO GCS INPUTS ############
bucket_path = {
  "file1" = {
    path   = "../src/text.txt"
    bucket = "testing_github_workflow"
    name   = "folder1/text.txt"
  }
}
