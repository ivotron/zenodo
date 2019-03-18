workflow "Publish Deposition" {
  resolves = "publish deposition"
}
action "publish deposition" {
  uses = "./publish_deposition"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_DEPOSIT_ID = "264101"
  }
}