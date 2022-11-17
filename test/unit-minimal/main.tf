module "test" {
  source = "../.."

  # add all required arguments

  repository = "unit-minimal-${local.random_suffix}"
  location   = "us-central1"

  # add all optional arguments that create additional/extended resources

  role = "roles/artifactregistry.reader"
  # add most/all other optional arguments
}

module "test2" {
  source = "../.."

  # add all required arguments

  repository = "unit-minimal-${local.random_suffix}"
  location   = "us-central1"

  policy_bindings = [
    {
      role = "roles/artifactregistry.reader"
      members = [
        "user:member@example.com",
      ]
    }
  ]
}
