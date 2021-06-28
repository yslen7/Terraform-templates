resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.appName}-${var.environment}-rg"
  location = var.location
  tags = {
    Created_By        = var.created_by
    Created_Date_Time = formatdate("YYYY-MMM-DD hh:mm", timestamp())
    Environment_Type  = var.environment_type
    Friendly_Name     = var.friendly_name
  }
}