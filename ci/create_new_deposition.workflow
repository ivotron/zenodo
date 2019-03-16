workflow "Create Zenodo Depostion" {
  resolves = "create deposition"
}
action "create deposition" {
  uses = "create_deposition/"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA = "../metadata.json"
  }
}