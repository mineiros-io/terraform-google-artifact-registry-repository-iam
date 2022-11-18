module "test-registry" {
  source = "github.com/mineiros-io/terraform-google-artifact-registry-repository?ref=v0.0.3"

  repository_id = "unit-complete-${local.random_suffix}"
  location      = "us-central1"
}

module "test-sa" {
  source = "github.com/mineiros-io/terraform-google-service-account?ref=v0.0.10"

  account_id = "service-account-id"
}
module "test" {
  source = "../.."

  # add all required arguments

  repository = module.test-registry.repository
  location   = "us-central1"

  # add all optional arguments that create additional/extended resources

  role = "roles/artifactregistry.reader"
  members = [
    "user:member@example.com",
    "computed:myserviceaccount",
  ]
  computed_members_map = {
    myserviceaccount = "serviceAccount:${module.test-sa.service_account.email}"
  }
  # add most/all other optional arguments

  module_depends_on = [
    module.test-registry,
    module.test-sa
  ]
}

module "test2" {
  source = "../.."

  # add all required arguments

  repository = module.test-registry.repository
  location   = "us-central1"

  # add all optional arguments that create additional/extended resources

  authoritative = false
  role          = "roles/artifactregistry.reader"
  members = [
    "user:member@example.com",
    "computed:myserviceaccount",
  ]
  computed_members_map = {
    myserviceaccount = "serviceAccount:${module.test-sa.service_account.email}"
  }
  # add most/all other optional arguments

  module_depends_on = [
    module.test-registry,
    module.test-sa
  ]
}

module "test3" {
  source = "../.."

  # add all required arguments

  repository = module.test-registry.repository
  location   = "us-central1"

  # add all optional arguments that create additional/extended resources

  policy_bindings = [
    {
      role = "roles/artifactregistry.reader"
      members = [
        "user:member@example.com",
        "computed:myserviceaccount",
      ]
    },
    {
      role = "roles/artifactregistry.writer"
      members = [
        "user:member@example.com",
      ]
    }
  ]

  computed_members_map = {
    myserviceaccount = "serviceAccount:${module.test-sa.service_account.email}"
  }

  # add most/all other optional arguments

  module_depends_on = [
    module.test-registry,
    module.test-sa
  ]
}
