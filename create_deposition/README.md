# Action for Creating Zenodo-Depostion
This action creates a deposition with the metadata provided in `metadata.json` file.

## Usage
To create a deposition,first add the metadata to `metadata.json` file in the root directory. 
Run `ci/create_new_depostion.workflow`.

```hcl
workflow "Create Zenodo Depostion" {
  resolves = "create deposition"
}
action "create deposition" {
  uses = "create_deposition/"
  secrets = ["ZENODO_API_TOKEN"]
  env = {
    ZENODO_METADATA = "../metadata.json"
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
This action will output the response from Zenodo to `resp.json` in `create_depostion` directory.

## Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

## Environment variables
* `ZENODO_METADATA` - **Required** Path to `metadata.json` file.

