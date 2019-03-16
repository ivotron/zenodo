workflow "Upload Files" {
  resolves = "upload files"
}
action "upload files" {
  uses = "upload_files/"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_DEPOSIT_ID = ""
    UPLOAD_FILES_DIRECTORY = "../files"
  }
}