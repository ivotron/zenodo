workflow "Create Zenodo Depostion" {
  resolves = "create"
}
action "create" {
  uses = "./create"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA_PATH = "./ci/metadata.json"
    ZENODO_USE_SANDBOX = "true"
  }
}