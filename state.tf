terraform {
  backend "artifactory" {
    # url     = "http://localhost:8081/artifactory"
    repo    = "tfstate"
    subpath = "tf-ansible-state"
  }
}
