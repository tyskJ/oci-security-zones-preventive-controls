/************************************************************
Configuration
************************************************************/
resource "oci_cloud_guard_cloud_guard_configuration" "this" {
  depends_on = [
    oci_identity_policy.cloud_guard_policy
  ]
  compartment_id        = var.tenancy_ocid
  reporting_region      = local.region_map["NRT"]
  status                = "ENABLED" # ENABLED or DISABLED
  self_manage_resources = false
}