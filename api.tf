resource "azurerm_app_service" "api" {
  name                    = "${var.prefix}-${var.appName}-${var.environment}-api"
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg.name
  app_service_plan_id     = azurerm_app_service_plan.asp.id
  https_only              = false
  client_affinity_enabled = true
  tags = {
    Created_By        = var.created_by
    Created_Date_Time = formatdate("YYYY-MMM-DD hh:mm", timestamp())
    Environment_Type  = var.environment_type
    Friendly_Name     = var.friendly_name
  }
  site_config {
    always_on                 = false
    number_of_workers         = 1
    http2_enabled             = false
    php_version               = "5.6"
    ftps_state                = "AllAllowed"
    scm_type                  = "VSTSRM"
    use_32_bit_worker_process = true
    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
      "hostingstart.html"
    ]
  }

  app_settings = {
    "apiKey:0"                                        = uuid()
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = "${azurerm_application_insights.appinsights.instrumentation_key}"
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "disabled"
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = "disabled"
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~2"
    "Auth0:Audience"                                  = var.auth0_Audience
    "Auth0:Authority"                                 = var.auth0_Authority
    "Auth0:ManagementAPI:Audience"                    = var.auth0_ManagementAPI_Audience
    "Auth0:ManagementAPI:ClientID"                    = var.auth0_ManagementAPI_ClientID
    "Auth0:ManagementAPI:ClientSecret"                = var.auth0_ManagementAPI_ClientSecret
    "Auth0:ManagementAPI:GrantType"                   = var.auth0_ManagementAPI_GrantType
    "Auth0:ThisAPI:Audience"                          = var.auth0_Audience
    "Auth0:ThisAPI.ClientID"                          = var.auth0_ThisAPI_ClientID
    "Auth0:ThisAPI:ClientSecret"                      = var.auth0_ThisAPI_ClientSecret
    "Auth0:ThisAPI:GrantType"                         = var.auth0_ThisAPI_GrantType
    "Auth0:ThisAPI:Scope"                             = var.auth0_ThisAPI_Scope
    "CosmosDB:DatabaseName"                           = var.cosmosDB_DatabaseName
    "CosmosDB:UsersContainer"                         = var.cosmosDB_UsersContainer
    "DiagnosticServices_EXTENSION_VERSION"            = "disabled"
    "InstrumentationEngine_EXTENSION_VERSION"         = "disabled"
    "SnapshotDebugger_EXTENSION_VERSION"              = "disabled"
    "Storage:Containers:0"                            = "${azurerm_storage_container.static-files.name}"
    "Storage:Queues:1"                                = var.storage_Queues1
    "WEBSITE_RUN_FROM_PACKAGE"                        = "1"
    "WEBSITE_TIME_ZONE"                               = var.timeZone
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = "disabled"
    "XDT_MicrosoftApplicationInsights_Java"           = "disabled"
    "XDT_MicrosoftApplicationInsights_Mode"           = "default"
    "XDT_MicrosoftApplicationInsights_NodeJS"         = "disabled"
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = "disabled"
  }

  connection_string {
    name  = "CosmosDB"
    type  = "Custom"
    value = "AccountEndpoint=${data.azurerm_cosmosdb_account.db.endpoint};AccountKey=${data.azurerm_cosmosdb_account.db.primary_master_key};"
  }

  connection_string {
    name  = "Storage"
    type  = "Custom"
    value = azurerm_storage_account.storageacc.primary_connection_string
  }
}