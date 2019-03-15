workflow "Zenodo Publish" {
  resolves = "publish"
}
action "publish" {
  uses = "publisher/"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    "ZENODO_DEPOSIT_ID" = "263550"
  }
}