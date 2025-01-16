resource "oci_objectstorage_bucket" "sample" {
  compartment_id = var.compartment_id
  name           = "sample-bucket-shukawam"
  namespace      = "orasejapan"
}
