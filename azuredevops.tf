data "azuredevops_project" "p" {
  name = var.ado_project
}

data "azuredevops_git_repository" "repoapi" {
  project_id = data.azuredevops_project.p.id
  name       = var.ado_repo_api
}

resource "azuredevops_build_definition" "buildapi" {
  project_id = data.azuredevops_project.p.id
  name       = var.ado_build_api
  path       = var.ado_build_api_path

  ci_trigger {
    use_yaml = true
  }

  repository {
    branch_name = var.branch_name
    repo_type   = "TfsGit"
    repo_id     = data.azuredevops_git_repository.repoapi.id
    yml_path    = "azure-pipelines.yml"
  }

  variable {
    name  = "BuildConfiguration"
    value = "release"
  }

  variable {
    name  = "BuildPlatform"
    value = "any cpu"

  }

  variable {
    name  = "system.collectionId"
    value = "3ee03527-698e-4bb0-9020-3db72d71b794"
  }

  variable {
    name  = "system.debug"
    value = "false"
  }

  variable {
    name  = "system.definitionId"
    value = "61"
  }
}