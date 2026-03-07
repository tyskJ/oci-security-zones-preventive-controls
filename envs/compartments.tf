/************************************************************
Compartment - workload
************************************************************/
resource "oci_identity_compartment" "parent" {
  compartment_id = var.tenancy_ocid
  name           = "Parent"
  description    = "Parent For oci-security-zones-start-security-bestpractices"
  enable_delete  = true
}

resource "oci_identity_compartment" "child" {
  compartment_id = oci_identity_compartment.parent.id
  name           = "Parent"
  description    = "Parent For oci-security-zones-start-security-bestpractices"
  enable_delete  = true
  defined_tags   = local.common_defined_tags
}