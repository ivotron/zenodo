workflow "Zenodo Actions" {
  resolves = "upload"
}
action "upload" {
  uses = "uploader/"
  secrets = ["ZENODO_API_TOKEN"]
}