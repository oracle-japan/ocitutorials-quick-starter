resource "oci_core_instance" "instance" {
  count               = var.attendee
  availability_domain = local.ad
  compartment_id      = var.compartment_ocid
  source_details {
    source_id   = local.oracle_linux_9
    source_type = "image"
  }
  shape = local.shape
  shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }
  display_name = format("%s-instance-%s", var.prefix, count.index + 1)
  create_vnic_details {
    assign_public_ip          = true
    assign_private_dns_record = false
    subnet_id                 = oci_core_subnet.public_subnet.id
  }
  metadata = {
    user_data = base64encode(templatefile("./template/cloud-init.yaml", {
      ssh_authorized_keys = var.ssh_authorized_keys
    }))
  }
  freeform_tags = local.freeform_tags
}
