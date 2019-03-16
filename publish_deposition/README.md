# Action for Publishing Zenodo-Deposition
This action will publish a deposition if it is ready to be published by extracting the `ID` from previously generated `resp.json` file in `/create_deposition` or `ID` from `ZENODO_DEPOSIT_ID` environment variable.
`ZENODO_DEPOSIT_ID` will override the ID from `resp.json`.

## Usage
If there is an unpublished deposition created through `create_new_deposition` workflow, it would publish the deposition by reading the `ID` from `/create_deposition/resp.json`.
If you want to publish any other deposition, set the Environment variable `ZENODO_DEPOSIT_ID` to the ID of deposition you want to publish. 
Run `ci/publish_deposition.workflow`.
```hcl
workflow "Publish Deposition" {
  resolves = "publish deposition"
}
action "publish deposition" {
  uses = "publish_deposition/"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_DEPOSIT_ID = "263701"
  }
}
```
This action will output the response from Zenodo to `resp.json` in `publish_deposition` directory.

## Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

## Environment variables
* `ZENODO_DEPOSIT_ID` = **Optional** ID of the deposition to be published. **Required** if no deposition ever created using `create_new_deposition`.
