provider "oci" {
  auth   = "InstancePrincipal"
  region = var.region
}

terraform {
  required_version = "1.5.7"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.21.0"
    }
  }
}
