workflow "Create Record" {
  resolves = "publish"
}

action "create" {
  uses = "./create"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA_PATH = "./ci/metadata.json"
    ZENODO_USE_SANDBOX = "true"
  }
}

action "upload" {
  needs = "create"
  uses = "./upload"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    UPLOAD_FILES_DIRECTORY_PATH = "./files"
    ZENODO_USE_SANDBOX = "true"
  }
}

action "publish" {
  needs="upload"
  uses = "./publish"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_USE_SANDBOX = "true"
  }
}