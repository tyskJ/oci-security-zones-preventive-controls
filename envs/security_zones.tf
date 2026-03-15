/************************************************************
Zones - root compartment target
************************************************************/
resource "oci_cloud_guard_security_zone" "root" {
  depends_on = [
    oci_cloud_guard_cloud_guard_configuration.this
  ]
  compartment_id          = var.tenancy_ocid
  display_name            = "root-maximum"
  description             = "Target Root Compartment attached maximum security recipe"
  security_zone_recipe_id = local.oracle_recipe_id
}

/************************************************************
Custom Security recipes
************************************************************/
resource "oci_cloud_guard_security_recipe" "this" {
  depends_on = [
    oci_cloud_guard_cloud_guard_configuration.this
  ]
  compartment_id    = var.tenancy_ocid
  display_name      = "custom-recipe"
  description       = "Custom security recipe for other security zones"
  security_policies = local.oracle_policy_ids
}

/************************************************************
Zones - child compartment target
************************************************************/
resource "oci_cloud_guard_security_zone" "child" {
  depends_on = [
    oci_cloud_guard_cloud_guard_configuration.this
  ]
  compartment_id          = oci_identity_compartment.workload.id
  display_name            = "child-custom"
  description             = "Target Child Compartment attached custom security recipe"
  security_zone_recipe_id = oci_cloud_guard_security_recipe.this.id
}

/************************************************************
local-exec
************************************************************/
resource "terraform_data" "remove_security_zones" {
  depends_on = [
    oci_cloud_guard_security_zone.root
  ]
  input = {
    compartment_ocid = oci_identity_compartment.workload.id
    security_zone_id = oci_cloud_guard_security_zone.root.id
  }
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      oci cloud-guard security-zone remove \
      --compartment-id ${self.input.compartment_ocid} \
      --security-zone-id ${self.input.security_zone_id} \
      --profile ADMIN \
      --auth security_token
      sleep 30
    EOT
  }
}