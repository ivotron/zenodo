# Action for Zenodo-file-upload
This action will upload files to an existing unpublished deposition.

## Usage
Put the files you want to upload in `/files` directory in root.
Run `ci/upload_files.workflow`.

```hcl
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
```
It would push the files to recently created deposition created by `ci/create_new_deposition.workflow`.
## Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

## Environment variables
* `UPLOAD_FILES_DIRECTORY` - **Required** path to directory containing the files to be uploaded.
* `ZENODO_DEPOSIT_ID` - **Optional** ID of the deposition in which the files are to be uploaded. **Required** if no deposition ever created using `create_new_deposition`.
