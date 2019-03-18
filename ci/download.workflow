workflow "Download" {
  resolves = "download"
}
action "download" {
  uses = "./download"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_RECORD_ID = "263717"
    ZENODO_OUTPUT_DIR = "./data"
    ZENODO_FILES=""
  }
}