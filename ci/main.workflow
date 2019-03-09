workflow "Zenodo Actions" {
  resolves = ["upload"]
}

action "upload" {
  uses = "uploader/"
  args = ""
}