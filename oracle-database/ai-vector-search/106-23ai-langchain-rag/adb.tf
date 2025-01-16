resource "oci_database_autonomous_database" "adp" {
  count                               = var.attendee
  compartment_id                      = var.compartment_ocid
  display_name                        = format("%s-atp-%s", var.prefix, count.index + 1)
  db_name                             = format("%satp%s", var.prefix, count.index + 1)
  db_workload                         = "OLTP"
  db_version                          = "23ai"
  compute_count                       = "2"
  compute_model                       = "ECPU"
  is_auto_scaling_enabled             = "true"
  data_storage_size_in_tbs            = "1"
  is_auto_scaling_for_storage_enabled = "false"
  admin_password                      = local.adb_admin_password
  customer_contacts {
    email = var.contact_email
  }
  freeform_tags = local.freeform_tags
  subnet_id     = oci_core_subnet.public_subnet.id
}
