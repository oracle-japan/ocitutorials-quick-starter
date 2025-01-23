# find home_region for provider
locals {
  region_map = {
    for r in data.oci_identity_regions.regions.regions :
    r.key => r.name
  }

  home_region = lookup(local.region_map, data.oci_identity_tenancy.tenancy.home_region_key)
}

# Required for IAM resource creation. IAM resource must be created in the tenancy home region.
provider "oci" {
  alias  = "homeregion"
  region = local.home_region
}

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
