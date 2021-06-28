variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "prefix" {
  type    = string
  default = "test"
}

variable "appName" {
  type    = string
  default = "imp"
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "timeZone" {
  type = string
}

variable "created_by" {
  type = string
}

variable "environment_type" {
  type = string
}

variable "friendly_name" {
  type = string
}


variable "auth0_Authority" {
  type = string
}

variable "auth0_Audience" {
  type = string
}

variable "auth0_ManagementAPI_ClientID" {
  type      = string
  sensitive = true
}

variable "auth0_ManagementAPI_ClientSecret" {
  type      = string
  sensitive = true
}

variable "auth0_ManagementAPI_Audience" {
  type = string
}

variable "auth0_ManagementAPI_GrantType" {
  type = string
}

variable "auth0_ThisAPI_ClientID" {
  type      = string
  sensitive = true
}

variable "auth0_ThisAPI_ClientSecret" {
  type      = string
  sensitive = true
}

variable "auth0_ThisAPI_Scope" {
  type = string
}

variable "auth0_ThisAPI_GrantType" {
  type = string
}

variable "cosmosDB_DatabaseName" {
  type = string
}

variable "cosmosDB_UsersContainer" {
  type = string
}

variable "storage_Queues1" {
  type    = string
  default = "auth0-sync"
}

variable "API_Server" {
  type = string
}

variable "ado_url" {
  type        = string
  description = "Azure DevOps Organization URL"
}

variable "ado_pat" {
  type        = string
  description = "Azure DevOps Personal Access Token"
  sensitive   = true
}

variable "branch_name" {
  type        = string
  description = "Branch name for the Azure DevOps pipeline"
}

variable "ado_project" {
  type        = string
  description = "Azure DevOps Project Name"
}

variable "ado_repo_api" {
  type        = string
  description = "Azure DevOps Repository for API"
}

variable "ado_build_api" {
  type        = string
  description = "Azure DevOps Build Definition Name for API"
}

variable "ado_build_api_path" {
  type        = string
  description = "Azure DevOps Folder Path of the Build Definition for API"
}