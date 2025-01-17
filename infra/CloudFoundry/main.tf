
resource "cloudfoundry_space" "project_space" {
  name = lower(replace("${var.subaccount_stage}-${var.project_name}", " ", "-"))
  org  = var.cf_org_id
}

resource "cloudfoundry_space_role" "space_manager" {
  count    = length(var.cf_space_manager) > 0 ? 1 : 0
  username = var.cf_space_manager
  type     = "space_manager"
  space    = cloudfoundry_space.project_space.id
  origin   = "sap.ids"
}

resource "cloudfoundry_space_role" "space_developer" {
  count    = length(var.cf_space_developer) > 0 ? 1 : 0
  username = var.cf_space_developer
  type     = "space_developer"
  space    = cloudfoundry_space.project_space.id
  origin   = "sap.ids"
}

resource "cloudfoundry_space_role" "space_supporter" {
  count    = length(var.cf_space_supporter) > 0 ? 1 : 0
  username = var.cf_space_supporter
  type     = "space_supporter"
  space    = cloudfoundry_space.project_space.id
  origin   = "sap.ids"
}
