provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfe_token
}

provider "github" {
  token = var.github_token
}

# Define the VCS provider (GitHub)
resource "tfe_vcs_configuration" "github" {
  organization = var.organization
  hostname     = "github.com"

  # If using GitHub Enterprise, specify the hostname accordingly
  # hostname = "github.myenterprise.com"

  # Note: Additional configuration may be required based on your GitHub setup
}

# Define the project
resource "tfe_project" "project" {
  organization = var.organization
  name         = var.project_name
}

# Define the workspaces using a for_each loop
resource "tfe_workspace" "workspace" {
  for_each    = var.workspaces
  name        = each.value.name
  organization = var.organization
  project_id  = tfe_project.project.id

  # VCS Repository Configuration
  vcs_repo {
    identifier          = each.value.repo      # Format: "github-org/repo-name"
    branch              = each.value.branch
    oauth_token_id      = tfe_vcs_configuration.github.oauth_token_id
    ingress_submodules  = true
  }

  # Optional: Workspace Variables
  # variable "example" {
  #   key   = "example_variable"
  #   value = "example_value"
  # }
}

