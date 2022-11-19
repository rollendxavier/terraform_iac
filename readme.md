### High level

├───modules
│   ├───network
|     |───main.tf
|     |───outputs.tf
|     |───variables.tf
│   ├───database
│   └───api_app
├───main.tf
└───readme.md


## Example: Passing Terraform Variables in your Pipeline
terraform init \
-backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" \
-backend-config="container_name=$CONTAINER_NAME" \
-backend-config="key=$STATE_BLOB_FILE" \
-backend-config="access_key=$TF_STATE__ACCESS_KEY"