# variable "dbnames" {
#     default = [
#         "MyData",
#         "TestData"
#     ]
# }


resource "azurerm_template_deployment" "failovergroup" {
  name                = "failover"
  resource_group_name = "cdw-sqlreptest-20190620"
  template_body       = "${file("arm.json")}"
  
  parameters {
    # "sqlServerPrimaryName"   = "cdw-sqlreptestsouth-20190620"
    # "sqlServerSecondaryName" = "cdw-sqlreptesteast-20190620"
  }
  
  deployment_mode     = "Incremental"
  count               = "1"
}