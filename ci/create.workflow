workflow "Create Zenodo Depostion" {
  resolves = "create"
}
action "create" {
  uses = "arshul/zenodo/create@master"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA_PATH = "./ci/metadata.json"
  }
}