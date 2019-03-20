# Github Actions for Zenodo

Documentation for each action could be found in their respective directories.

## Create a Record 
To publish a record at [Zenodo](https://zenodo.org/), run `ci/create_record.workflow`.

### Usage
Keep the metadata in `metadata.json` file.
Put the files to be uploaded in `/files` directory.
Run `ci/create_record.workflow`. It would create a deposition with the provided metadata and uploads the files in `/files` directory and publishes the record. You can find the `resp.json` file in `ci/publish_deposition` which would include the details about the record.
### Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

### Environment variables
* `ZENODO_METADATA` - **Required** Path to `metadata.json` file.
* `ZENODO_UPLOAD_PATH` - **Required** path to directory containing the files to be uploaded.
