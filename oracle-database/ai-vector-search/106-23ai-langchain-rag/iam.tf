resource "oci_identity_dynamic_group" "ocitutorial_dynamic_group" {
  # Need to create home region.
  provider       = oci.homeregion
  compartment_id = var.compartment_ocid
  description    = "Dynamic group for OCI Tutorials"
  name           = "ocitutorials-dynamic-group"
  matching_rule  = format("resource.compartment.id = '%s'", var.compartment_ocid)
}

resource "oci_identity_policy" "ocitutorial_policy" {
  # Need to create home region.
  provider       = oci.homeregion
  compartment_id = var.compartment_ocid
  description    = "IAM Policy for OCI Tutorials"
  name           = "ocitutorials-iam-policy"
  statements     = [format("Allow dynamic-group %s to manage all-resources in tenancy", oci_identity_dynamic_group.ocitutorial_dynamic_group.name)]
}
