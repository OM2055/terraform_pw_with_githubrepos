variable "tfe_token" {
  default = "your-terraform-cloud-token"
}

variable "github_token" {
  default = "your-github-oauth-token"
}

variable "organization" {
  default = "your-organization-name"
}

variable "project_name" {
  default = "your-project-name"
}

variable "workspaces" {
  default = {
    workspace1 = {
      name   = "workspace-one"
      repo   = "github-org/repo-one"
      branch = "main"
    },
    workspace2 = {
      name   = "workspace-two"
      repo   = "github-org/repo-two"
      branch = "develop"
    },
    workspace3 = {
      name   = "workspace-three"
      repo   = "github-org/repo-three"
      branch = "feature"
    }
  }
}
