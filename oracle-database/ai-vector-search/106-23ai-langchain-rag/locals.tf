##### Commons
locals {
  freeform_tags = {
    "tutorial" : "106-23ai-langchain-rag"
  }
}

##### Networks
locals {
  cidr_block = {
    all     = "0.0.0.0/0"
    vcn     = "192.168.0.0/16"
    public  = "192.168.1.0/24"
    private = "192.168.2.0/24"
  }
  dns_label = {
    vcn     = "vcn"
    public  = "public"
    private = "private"
  }
  source_type = {
    cidr_block = "CIDR_BLOCK"
  }
  destination_type = {
    cidr_block         = "CIDR_BLOCK"
    service_cidr_block = "SERVICE_CIDR_BLOCK"
  }
  protocol = {
    all     = "all"
    icmp    = "1"
    tcp     = "6"
    udp     = "17"
    icmp_v6 = "58"
  }
  ad           = data.oci_identity_availability_domains.ads.availability_domains[0].name
  all_services = data.oci_core_services.all_services.services.0
}

##### Compute
locals {
  oracle_linux_9 = data.oci_core_images.oracle_linux_9.images[0].id
  shape          = data.oci_core_shapes.shapes.shapes[0].name
}

##### Autonomous Database
locals {
  adb_admin_password = "ChangeMe!!12345"
}
