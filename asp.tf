resource "azurerm_app_service_plan" "asp" {
  name                = "${var.prefix}-${var.appName}-${var.environment}-asp"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "app"
  tags = {
    Created_By        = var.created_by
    Created_Date_Time = formatdate("YYYY-MMM-DD hh:mm", timestamp())
    Environment_Type  = var.environment_type
    Friendly_Name     = var.friendly_name
  }
  sku {
    tier     = "Basic"
    size     = "B1"
    capacity = 1
  }
}