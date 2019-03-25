workflow "Upload Files" {
  resolves = "upload"
}
action "upload" {
  uses = "./upload"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_DEPOSIT_ID = ""
    ZENODO_UPLOAD_PATH = "./data"
    ZENODO_USE_SANDBOX = "true"
  }
}