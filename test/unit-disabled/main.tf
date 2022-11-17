module "test" {
  source = "../.."

  module_enabled = false

  # add all required arguments

  repository = "unit-disabled"
  location   = "us-central1"

  # add all optional arguments that create additional/extended resources

  role = "roles/artifactregistry.reader"
  members = [
    "user:member@example.com",
  ]
  # add most/all other optional arguments
}

module "test2" {
  source = "../.."

  module_enabled = false

  # add all required arguments

  repository = "unit-disabled"
  location   = "us-central1"

  # add all optional arguments that create additional/extended resources

  authoritative = false
  role          = "roles/artifactregistry.reader"
  members = [
    "user:member@example.com",
  ]
  # add most/all other optional arguments
}

module "test3" {
  source = "../.."

  module_enabled = false

  # add all required arguments

  repository = "unit-disabled"
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

  # add most/all other optional arguments
}
