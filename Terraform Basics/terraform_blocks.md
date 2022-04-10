# Terraform basic block
Terraform block
    defines behaviour
    defines what version of terraform CLI its going to use
    defines cloud provider and its version
    defines backend ( state file)
        only CONSTANT values are allowed
provider block
    heart of terraform
    tf relies on providers to interact with remote system
    provider block declare providers to install providers and use them
resource block
