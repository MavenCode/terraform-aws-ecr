# terraform-aws-ecr deployment

####

This is a template repository that can be re-used when provisioning amazon elastic container registry service infrastructure using terraform. Included is an example-module implementation with necessary argument list documentated for flexibility, and default arguments provided for handling exceptions from uninstantiated module run for a robust build.

On flexible build, a default default-policy.json file is provided with this module, allowing for viable aes module deployment using this policy definition. And a custom policy can be imported as a .json manifest passed to the module's "policy" input argument.

See below for user provided variables to customize sqs deployment. Also available in the variables.tf file with the variable type expected.

| Input variables   | Description                                                                                            |
| ----------------- | ------------------------------------------------------------------------------------------------------ |
| "repo_name"       | name for the container image to upload                                                                 |
| "encryption_type" | KMS or AES256 registry encryption technique, Key value management(KMS) can be used for custom security |
| policy            | .json file with custom ecr policy, resources, actions, etc defined                                     |
| "image_push_scan" | bool val to flag whether images pushed to registry is auto-scanned or manually                         |
| tag_name          | infrastructure deployment framework -"Terraform"                                                       |
| env_name          | infrastructure environment; "dev", "test", "prod", "QA" and so on                                      |

Below, the provider requirement for module implementation and the infrastructure provider
| Requirements | |
|:---- | ----:|
| Name | Version |
| terraform | ~> 1.0, latest preferred |
| aws | ~> 3.27, latest preferred |

###### secret_key and access_key sensitive info | provided in deployment pipeline.
