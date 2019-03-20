workflow "Publish Deposition" {
  resolves = "publish"
}
action "publish" {
  uses = "arshul/zenodo/publish@master"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_DEPOSIT_ID = ""
  }
}