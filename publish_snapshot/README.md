# Action for Publishing Zenodo-Deposition
This action will publish a deposition if it is ready to be published using the `ID` from `ZENODO_DEPOSIT_ID` environment variable.

## Usage
Set the Environment variable `ZENODO_DEPOSIT_ID` to the ID of deposition you want to publish. 
Run `ci/publish_snapshot.workflow`.
```hcl
workflow "Zenodo Publish" {
  resolves = "publish snapshot"
}
action "publish snapshot" {
  uses = "publish_snapshot/"
  secrets = [ "ZENODO_API_TOKEN" ]
  env = {
    ZENODO_DEPOSIT_ID = "263550"
  }
}
```
This action will output the response from Zenodo to `resp.json` in `publish_snapshot` directory.

## Secrets
* `ZENODO_API_TOKEN` - **Required** The API access_token for zenodo account.

## Environment variables
* `ZENODO_DEPOSIT_ID` = **Required** ID of the deposition to be published.
