workflow "Create Record" {
  resolves = "publish"
}

action "create deposition" {
  uses = "./create_deposition"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA = "./metadata.json"
  }
}

action "upload files" {
  needs = "create deposition"
  uses = "./upload_files"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    UPLOAD_FILES_DIRECTORY = "./files"
  }
}

action "publish" {
  needs="upload files"
  uses = "./publish_deposition"
  secrets = [ "ZENODO_API_TOKEN" ]
}