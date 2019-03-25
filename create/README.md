# Action for Creating Zenodo-Depostion
This action creates a deposition with the metadata provided in `metadata.json` file.

## Usage
To create a deposition, add the metadata to `metadata.json` file. Assign the path to `metadata.json` file to `ZENODO_METADATA_PATH` environment variable. 

```hcl
workflow "Create Zenodo Depostion" {
  resolves = "create"
}
action "create" {
  uses = "popperized/zenodo/create@master"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA_PATH = "./metadata.json"
  }
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
This action will output the response from Zenodo to `$GITHUB_WORKSPACE/create_resp.json`

## Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

## Environment variables
* `ZENODO_METADATA_PATH` - **Required** Path to `metadata.json` file.

