# Action for Zenodo-files-download
This action will download files from a record.

## Usage
Run `ci/download.workflow`.
```hcl
workflow "Download" {
  resolves = "download"
}
action "download" {
  uses = "download/"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_RECORD_ID = "263717"
    ZENODO_OUTPUT_DIR = "../files"
    ZENODO_FILES="a_file_to_upload,another_file"
  }
}
```
## Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

## Environment variables
* `ZENODO_RECORD_ID` - **Required** ID of the record from which files to be downloaded.
* `ZENODO_OUTPUT_DIR`- **Required** Path to the output directory.
* `ZENODO_FILES`- **Optional** String with names of files separated by `,` to be downloaded . If omitted, all files are downloaded from the record. 
