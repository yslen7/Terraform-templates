resource "azurerm_cdn_profile" "cdn" {
  name                = "${var.prefix}-${var.appName}-${var.environment}-cdn"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "cdnendpoint" {
  name                = "${var.prefix}-${var.appName}-${var.environment}-cdn-ep"
  profile_name        = azurerm_cdn_profile.cdn.name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  content_types_to_compress = [
    "application/eot",
    "application/font",
    "application/font-sfnt",
    "application/javascript",
    "application/json",
    "application/opentype",
    "application/otf",
    "application/pkcs7-mime",
    "application/truetype",
    "application/ttf",
    "application/vnd.ms-fontobject",
    "application/xhtml+xml",
    "application/xml",
    "application/xml+rss",
    "application/x-font-opentype",
    "application/x-font-truetype",
    "application/x-font-ttf",
    "application/x-httpd-cgi",
    "application/x-javascript",
    "application/x-mpegurl",
    "application/x-opentype",
    "application/x-otf",
    "application/x-perl",
    "application/x-ttf",
    "font/eot",
    "font/ttf",
    "font/otf",
    "font/opentype",
    "image/svg+xml",
    "text/css",
    "text/csv",
    "text/html",
    "text/javascript",
    "text/js",
    "text/plain",
    "text/richtext",
    "text/tab-separated-values",
    "text/xml",
    "text/x-script",
    "text/x-component",
    "text/x-java-source"
  ]
  is_compression_enabled = true

  origin {
    name      = "storageacc"
    host_name = azurerm_storage_account.storageacc.primary_blob_host
  }
}