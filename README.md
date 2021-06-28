# Building Infrastructure with Terraform
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.

Here are some templates of Azure resources built in Terraform, but it´s important to change the variables and some configuration in each `.tf` file before running any terraform command.

## Getting Started
1. Download [Terraform](https://www.terraform.io/downloads.html) from the official page
2. Install Terraform by unzipping it and set `terraform.exe PATH` to environment variables. First Search for _Edit the system environment variables_ and then click on Advanced>Environment Variables>Path>New>Ok (see images below)
3. Download and install the current release of the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
4. After the installation is complete, close and reopen any active Windows Command Prompt or PowerShell windows to use the Azure CLI
5. To find your installed version and see if you need to update, run `az version` on PowerShell terminal
6. Run command `az login`. Choose your Microsoft Azure Account and *sign in* with your account credentials in the browser
7. If the CLI can´t open your default browser, open a browser page at [aka.ms/devicelogin](https://aka.ms/devicelogin) and enter the authorization code displayed in your terminal. If no web browser is available or the web browser fails to open, use device code flow with `az login --use-device-code`

![Step 2.1](https://i.postimg.cc/pL49FDJC/readmecentria.png)

![Step 2.2](https://i.postimg.cc/8CzvR12k/readmecentria2.png) 

![Step 2.3](https://i.postimg.cc/RFzNP48n/readmecentria3.png) 

![Step 2.4](https://i.postimg.cc/5tKCphJB/readmecentria4.png)

The code was built with Azure CLI version 2.24.0 and Terraform v1.0.1

## Build
1. Change variables in `terraform.tfvars` and change or add more `.tf` files if needed
2. Execute the command `terraform init` and then `terraform plan` on Powershell terminal
3. Execute `terraform apply --auto-approve`. The following resources are created: Application Insights, App Service, App Service Plan, Function App, Azure Cosmos DB account, CDN, Storage Account and an Azure DevOps build
4. If you want to delete all the resources created by Terraform, run `terraform destroy --auto-approve` 

## Additional Resources
More information about [Azure resources in Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

Run `terraform fmt` to rewrite Terraform configuration files to a canonical format and style or `terraform validate` to verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state.