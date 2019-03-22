# Github Actions for Zenodo
Documentation for each action could be found in their respective directories.

## Create a Record 
To publish a record at [Zenodo](https://zenodo.org/). See the below example.
```hcl
workflow "Create Record" {
  resolves = "publish"
}

action "create" {
  uses = "popperized/zenodo/create@master"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA_PATH = "./ci/metadata.json"
  }
}

action "upload" {
  needs = "create"
  uses = "popperized/zenodo/upload@master"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_UPLOAD_PATH = "./files"
  }
}

action "publish" {
  needs="upload"
  uses = "popperized/zenodo/publish@master"
  secrets = [ "ZENODO_API_TOKEN" ]
}
```
Example `metadata.json` file
```json
{
    "metadata": {
        "title": "Title here",
        "upload_type": "poster",
        "description": "This is just for test",
        "creators": [
            {
                "name": "Arshul, Arshul"
            }
        ]
    }
}
```
### Usage
Keep the metadata in a `json` file and set the path to this `json` file as `ZENODO_METADATA_PATH` environment variable.
Put the files to be uploaded in a directory and set the path to this directory as `ZENODO_UPLOAD_PATH` environment variable.
It would create a deposition with the provided metadata and uploads the files in `ZENODO_UPLOAD_PATH` directory and publishes the record.
### Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

### Environment variables
* `ZENODO_METADATA_PATH` - **Required** Path to `json` file containing metadata.
* `ZENODO_UPLOAD_PATH` - **Required** path to directory containing the files to be uploaded.
