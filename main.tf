data "azurerm_storage_account" "example" { 
  for_each = var.mssql_database_variables
  name = each.value.storage_account_name
  resource_group_name = each.value.storage_account_rg
  }
data "azurerm_mssql_server" "mssql_server" { 
  for_each = var.mssql_database_variables
  name = each.value.mssql_server_name 
  resource_group_name = each.value.mssql_server_resource_group_name 
  }

  data "azurerm_mssql_elasticpool" "elastic_pool" {
  for_each = {
    for key, value in var.mssql_database_variables :
    key => value if value.mssql_database_elastic_pool_name != null
  }
  name                = each.value.mssql_database_elastic_pool_name
  resource_group_name = each.value.mssql_server_resource_group_name
  server_name         = each.value.mssql_server_name
}

resource "azurerm_mssql_database" "mssql_database" {
  for_each                            = var.mssql_database_variables
  name                                = each.value.mssql_database_name
  server_id                           = data.azurerm_mssql_server.mssql_server[each.key].id
  auto_pause_delay_in_minutes         = each.value.mssql_database_auto_pause_delay_in_minutes
  create_mode                         = each.value.mssql_database_create_mode
  creation_source_database_id         = each.value.mssql_database_creation_source_database_name == null || !(each.value.mssql_database_create_mode == "Copy" || each.value.mssql_database_create_mode == "Recovery" || each.value.mssql_database_create_mode == "Restore" || each.value.mssql_database_create_mode == "PointInTimeRestore") ? null : each.value.creation_source_database_id
  collation                           = each.value.mssql_database_collation
  elastic_pool_id = each.value.mssql_database_elastic_pool_name != null ? data.azurerm_mssql_elasticpool.elastic_pool[each.key].id : null
  geo_backup_enabled                  = each.value.mssql_database_geo_backup_enabled
  maintenance_configuration_name = each.value.mssql_database_elastic_pool_name == null ? each.value.mssql_database_maintenance_configuration_name : null
  ledger_enabled                      = each.value.mssql_database_ledger_enabled
  license_type                        = each.value.mssql_database_license_type
  max_size_gb = each.value.mssql_database_create_mode == "Secondary" || each.value.mssql_database_create_mode == "OnlineSecondary" ? null : each.value.mssql_database_max_size_gb
  min_capacity                        = each.value.mssql_database_min_capacity
  restore_point_in_time               = each.value.mssql_database_create_mode == "PointInTimeRestore" ? each.value.mssql_database_restore_point_in_time : null
  recover_database_id                 = each.value.mssql_database_create_mode == "Recovery" ? each.value.mssql_database_recover_database_id : null
  restore_dropped_database_id         = each.value.mssql_database_create_mode == "Restore" ? each.value.mssql_restore_dropped_database_id       : null
  restore_long_term_retention_backup_id = each.value.mssql_database_create_mode == "RestoreLongTermRetentionBackup" ? each.value.mssql_database_restore_long_term_retention_backup_id : null
  read_scale                          = each.value.mssql_database_read_scale
  read_replica_count                  = each.value.mssql_database_read_replica_count
  sample_name                         = each.value.mssql_database_sample_name
  sku_name                            = each.value.mssql_database_sku_name
  zone_redundant                      = each.value.mssql_database_zone_redundant
  storage_account_type                = each.value.mssql_database_storage_account_type
  transparent_data_encryption_enabled = each.value.mssql_database_transparent_data_encryption_enabled

  dynamic "threat_detection_policy" {
    for_each = each.value.long_term_retention_policy.enabled ==true? [1] : []
    content {
      state                      = each.value.threat_detection_policy.threat_detection_policy_mssql_database_state
      disabled_alerts            = each.value.threat_detection_policy.threat_detection_policy_mssql_database_disabled_alerts
      email_account_admins       = each.value.threat_detection_policy.threat_detection_policy_mssql_database_email_account_admins
      email_addresses            = each.value.threat_detection_policy.threat_detection_policy_mssql_database_email_addresses
      retention_days             = each.value.threat_detection_policy.threat_detection_policy_threat_retention_days
      storage_account_access_key = each.value.mssql_database_storage_account_name != null ? data.azurerm_storage_account.storage_account[each.key].primary_access_key : null
      storage_endpoint           = each.value.mssql_database_storage_account_name != null ? data.azurerm_storage_account.storage_account[each.key].primary_blob_endpoint : null
    }
  }
dynamic "long_term_retention_policy" { 
  for_each = each.value.long_term_retention_policy.enabled ==true ? [1] : []
   content { 
    weekly_retention = each.value.long_term_retention_policy.long_term_retention_policy_mssql_database_weekly_retention 
    monthly_retention = each.value.long_term_retention_policy.long_term_retention_policy_mssql_database_monthly_retention 
    yearly_retention = each.value.long_term_retention_policy.long_term_retention_policy_mssql_database_yearly_retention 
    week_of_year = each.value.long_term_retention_policy.long_term_retention_policy_mssql_database_week_of_year 
    } 
    } 
    dynamic "short_term_retention_policy" { 
      for_each = each.value.short_term_retention_policy.enabled ==true? [1] : [] 
      content { 
        retention_days = each.value.short_term_retention_policy.short_term_retention_policy_mssql_database_short_retention_days 
        backup_interval_in_hours = each.value.short_term_retention_policy.short_term_retention_policy_backup_interval_in_hours 
        } 
        }
 dynamic "import" { 
  for_each = each.value.import != null ? [1] : [] 
  content { 
    storage_uri = each.value.import.mssql_database_import_storage_uri 
    storage_key = data.azurerm_storage_account.example.primary_access_key 
    storage_key_type = each.value.import.mssql_database_import_storage_key_type 
    administrator_login = each.value.import.mssql_database_import_administrator_login 
    administrator_login_password = each.value.import.mssql_database_import_administrator_login_password 
    authentication_type = each.value.import.mssql_database_import_authentication_type 
    storage_account_id = data.azurerm_storage_account.example.id 
    } 
    }

}