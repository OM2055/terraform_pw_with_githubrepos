variable "tfe_token" {
  type        = string
  description = "Terraform Cloud API Token"
}

variable "github_token" {
  type        = string
  description = "GitHub OAuth Token for Terraform Cloud VCS Access"
}

variable "organization" {
  type        = string
  description = "The name of your Terraform Cloud organization"
}

variable "project_name" {
  type        = string
  description = "The name of the Terraform Cloud project"
}

variable "workspaces" {
  description = "Map of workspaces with repo details"
  type = map(object({
    name   = string
    repo   = string
    branch = string
  }))
}
