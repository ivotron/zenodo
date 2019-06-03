workflow "Download" {
  resolves = "download"
}
action "download" {
  uses = "./download"
  env = {
    ZENODO_RECORD_ID = "263550"
    ZENODO_OUTPUT_PATH = "./263550"
    ZENODO_FILES=""
    ZENODO_USE_SANDBOX = "true"
  }
}