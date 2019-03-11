workflow "Zenodo Actions" {
  resolves = ["upload"]
}

action "upload" {
  uses = "uploader/"
  env = {
    ACCESS_TOKEN =
  }
}