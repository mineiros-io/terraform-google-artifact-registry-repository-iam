stack {
  name        = "terraform-google-artifact-registry-repository-iam"
  description = "github.com/mineiros-io/terraform-google-artifact-registry-repository-iam"
}

generate_hcl "versions.tf" {
  condition = terramate.stack.path.absolute == "/"

  content {
    terraform {
      required_version = global.terraform_version_constraint

      tm_dynamic required_providers {
        for_each = [1]
        attributes = {
          "${global.provider}" = {
            source  = "hashicorp/${global.provider}"
            version = global.provider_version_constraint
          }
        }
      }
    }
  }
}
