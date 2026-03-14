/************************************************************
Compartment - workload
************************************************************/
resource "oci_identity_compartment" "workload" {
  compartment_id = var.tenancy_ocid
  name           = "oci-security-zones-preventive-controls"
  description    = "Workload For oci-security-zones-preventive-controls"
  enable_delete  = true
}