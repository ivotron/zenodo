# Action for Publishing Zenodo-Deposition
This action will publish a deposition if it is ready to be published by extracting the `ID` from previously generated `/create_resp.json` or `ID` from `ZENODO_DEPOSIT_ID` environment variable.
`ZENODO_DEPOSIT_ID` will override the ID from `/create_resp.json`.

## Usage
If there is an unpublished deposition created through `create` workflow, it would publish the deposition by reading the `ID` from `/create_resp.json`.
If you want to publish any other deposition, set the Environment variable `ZENODO_DEPOSIT_ID` to the ID of deposition you want to publish. 

```hcl
workflow "Publish Deposition" {
  resolves = "publish"
}
action "publish" {
  uses = "popperized/zenodo/publish@master"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_DEPOSIT_ID = ""
  }
}
```

## Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

## Environment variables
* `ZENODO_DEPOSIT_ID` - **Optional** ID of the deposition to be published. **Required** if no deposition ever created using `create`.
