resource "azurerm_function_app" "auth0" {
  name                       = "${var.prefix}-${var.appName}-${var.environment}-auth0-fn"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.storageacc.name
  storage_account_access_key = azurerm_storage_account.storageacc.primary_access_key
  tags = {
    Created_By        = var.created_by
    Created_Date_Time = formatdate("YYYY-MMM-DD hh:mm", timestamp())
    Environment_Type  = var.environment_type
    Friendly_Name     = var.friendly_name
  }
  site_config {
    always_on = true
    scm_type  = "VSTSRM"
  }
  app_settings = {
    "API:Server"                            = var.API_Server
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = "${azurerm_application_insights.appinsights.instrumentation_key}"
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = "${azurerm_application_insights.appinsights.connection_string}" # Do not change this
    "Auth0:Audience"                        = var.auth0_Audience
    "Auth0:Authority"                       = var.auth0_Authority
    "Auth0:ManagementAPI:Audience"          = var.auth0_ManagementAPI_Audience
    "Auth0:ManagementAPI:ClientID"          = var.auth0_ManagementAPI_ClientID
    "Auth0:ManagementAPI:ClientSecret"      = var.auth0_ManagementAPI_ClientSecret
    "Auth0:ManagementAPI:GrantType"         = var.auth0_ManagementAPI_GrantType
    "Auth0:ThisAPI:Audience"                = var.auth0_Audience
    "Auth0:ThisAPI.ClientID"                = var.auth0_ThisAPI_ClientID
    "Auth0:ThisAPI:ClientSecret"            = var.auth0_ThisAPI_ClientSecret
    "Auth0:ThisAPI:GrantType"               = var.auth0_ThisAPI_GrantType
    "Auth0:ThisAPI:Scope"                   = var.auth0_ThisAPI_Scope
    "AzureWebJobsStorage"                   = "${azurerm_storage_account.storageacc.primary_connection_string}"                                                # Do not change this
    "CentriaConnect"                        = "${azurerm_storage_account.storageacc.primary_connection_string}"                                                #Do not change this
    "COSMOS:ConnectionString"               = "AccountEndpoint=${azurerm_cosmosdb_account.db.endpoint};AccountKey=${azurerm_cosmosdb_account.db.primary_key};" # Do not change this
    "COSMOS:Database"                       = var.cosmosDB_DatabaseName                                                                                        # Do not change this
    "COSMOS:Database:Container"             = var.cosmosDB_UsersContainer                                                                                      # Do not change this
    "FUNCTIONS_EXTENSION_VERSION"           = "~3"                                                                                                             # Do not change this
    "FUNCTIONS_WORKER_RUNTIME"              = "dotnet"
    "Storage:ConnectionString"              = "${azurerm_storage_account.storageacc.primary_connection_string}" # Do not change this
    "Storage:StaticFiles"                   = "${azurerm_storage_container.static-files.name}"                  # Do not change this  
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"       = "true"                                                            # Do not change this
    "WEBSITE_RUN_FROM_PACKAGE"              = "1"                                                               # Do not change this
    "WEBSITE_TIME_ZONE"                     = var.timeZone                                                      # Do not change this 
  }
}