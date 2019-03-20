workflow "Publish Deposition" {
  resolves = "publish"
}
action "publish" {
  uses = "./publish"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_DEPOSIT_ID = ""
    ZENODO_USE_SANDBOX = "true"
  }
}