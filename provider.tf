terraform {
  // Enabled so we can have optionals in our objects,
  // see: https://github.com/hashicorp/terraform/issues/19898
  experiments      = [module_variable_optional_attrs]
  required_version = ">= 1.0.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    organization = "learn-chef"
    workspaces {
      name = "terraform-github-repository"
    }
  }
}

provider "github" {
  owner = "learn-chef"
}
