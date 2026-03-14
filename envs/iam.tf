/************************************************************
IAM Policy - Cloud Guard
************************************************************/
resource "oci_identity_policy" "cloud_guard_policy" {
  compartment_id = var.tenancy_ocid
  description    = "This policy allows cloud guard service to detect security vulnerabilities in tenancy"
  name           = "CloudGuardPolicies"
  statements = [
    "allow service cloudguard to manage cloudevents-rules in tenancy where target.rule.type='managed'",
    "allow service cloudguard to read vaults in tenancy",
    "allow service cloudguard to read keys in tenancy",
    "allow service cloudguard to read compartments in tenancy",
    "allow service cloudguard to read tenancies in tenancy",
    "allow service cloudguard to read audit-events in tenancy",
    "allow service cloudguard to read compute-management-family in tenancy",
    "allow service cloudguard to read instance-family in tenancy",
    "allow service cloudguard to read virtual-network-family in tenancy",
    "allow service cloudguard to read volume-family in tenancy",
    "allow service cloudguard to read database-family in tenancy",
    "allow service cloudguard to read object-family in tenancy",
    "allow service cloudguard to read load-balancers in tenancy",
    "allow service cloudguard to read users in tenancy",
    "allow service cloudguard to read groups in tenancy",
    "allow service cloudguard to read policies in tenancy",
    "allow service cloudguard to read dynamic-groups in tenancy",
    "allow service cloudguard to read authentication-policies in tenancy",
    "allow service cloudguard to use network-security-groups in tenancy",
    "allow service cloudguard to read data-safe-family in tenancy",
    "allow service cloudguard to read autonomous-database-family in tenancy",
    "allow service cloudguard to read log-groups in tenancy",
    "Allow any-user to { WLP_BOM_READ } in tenancy where all { request.principal.id = target.agent.id, request.principal.type = 'workloadprotectionagent'}",
    "Allow any-user to { WLP_CONFIG_READ } in tenancy where all { request.principal.id = target.agent.id, request.principal.type = 'workloadprotectionagent'}",
    "Endorse any-user to { WLP_LOG_CREATE } in any-tenancy where all { request.principal.id = target.agent.id, request.principal.type = 'workloadprotectionagent' }",
    "Endorse any-user to { WLP_METRICS_CREATE } in any-tenancy where all { request.principal.id = target.agent.id, request.principal.type = 'workloadprotectionagent' }",
    "Endorse any-user to { WLP_ADHOC_QUERY_READ } in any-tenancy where all { request.principal.id = target.agent.id, request.principal.type = 'workloadprotectionagent' }",
    "Endorse any-user to { WLP_ADHOC_RESULTS_CREATE } in any-tenancy where all { request.principal.id = target.agent.id, request.principal.type = 'workloadprotectionagent'}",
  ]
}