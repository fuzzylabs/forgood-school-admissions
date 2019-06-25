terraform {
  backend "remote" {
    organization = "fuzzylabs"

    workspaces {
      name = "default"
    }
  }
}
