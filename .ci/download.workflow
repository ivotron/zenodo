workflow "Download" {
  resolves = "download"
}
action "download" {
  uses = "./download"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_RECORD_ID = "263717"
    ZENODO_OUTPUT_PATH = "./data"
    ZENODO_FILES=""
    ZENODO_USE_SANDBOX = "true"
  }
}