/************************************************************
Region
************************************************************/
data "oci_identity_regions" "regions" {
}

# output "tokyo_region" {
#   value = lookup({
#     for r in data.oci_identity_regions.regions.regions :
#     r.key => r.name
#   }, "NRT")
# }