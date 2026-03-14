/************************************************************
Zones - root compartment target
************************************************************/
resource "oci_cloud_guard_security_zone" "root" {
  compartment_id          = var.tenancy_ocid
  display_name            = "root-maximum"
  description             = "Target Root Compartment attached maximum security recipe"
  security_zone_recipe_id = data.oci_cloud_guard_security_recipes.maximum.security_recipe_collection[0].items[0].id
}