workflow "Zenodo Publish" {
  resolves = "publish"
}
action "publish" {
  uses = "publisher/"
  secrets = [ "ZENODO_API_TOKEN",
              "ZENODO_DEPOSIT_ID" ]
}