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

/************************************************************
local-exec
************************************************************/
resource "terraform_data" "disable_cloud_guard" {
  depends_on = [
    oci_identity_policy.cloud_guard_policy
  ]
  input = {
    tenancy_ocid = var.tenancy_ocid
    region       = local.region_map["NRT"]
  }
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      oci cloud-guard configuration update \
      --compartment-id ${self.input.tenancy_ocid} \
      --reporting-region ${self.input.region} \
      --status DISABLED \
      --profile ADMIN \
      --auth security_token
    EOT
  }
}