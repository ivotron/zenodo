workflow "Zenodo Publish" {
  resolves = "publish snapshot"
}
action "publish snapshot" {
  uses = "publish_snapshot/"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_DEPOSIT_ID = "263550"
  }
}