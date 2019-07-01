# Action for Zenodo-files-download
This action will download files from a record.

## Usage

```hcl
workflow "Download" {
  resolves = "download"
}
action "download" {
  uses = "popperized/zenodo/download@master"
  env = {
    ZENODO_RECORD_ID = "263717"
    ZENODO_OUTPUT_PATH = "./data"
    ZENODO_FILES="file1.ext,file2.ext"
  }
}
```

## Environment variables
* `ZENODO_RECORD_ID` - **Required** ID of the record from which files to be downloaded.
* `ZENODO_OUTPUT_PATH`- **Required** Path to the output directory.
* `ZENODO_FILES`- **Optional** String with names of files separated by `,` to be downloaded . If omitted, all files are downloaded from the record. 
