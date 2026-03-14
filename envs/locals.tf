/************************************************************
Region List
************************************************************/
locals {
  region_map = {
    for r in data.oci_identity_regions.regions.regions :
    r.key => r.name
  }
}

/************************************************************
Security Zones Maximum recipe
************************************************************/
locals {
  oracle_recipe_id = distinct([
    for r in data.oci_cloud_guard_security_recipes.maximum.security_recipe_collection[0].items : r.id
    if r.owner == "ORACLE"
  ])[0]
}