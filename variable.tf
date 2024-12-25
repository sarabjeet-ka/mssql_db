variable "mssql_database_variables" {
  description = "Map of MSSQL Database configurations"
  type = map(object({
    mssql_database_name                                  = string
    mssql_database_collation                             = string
    mssql_database_license_type                          = string
    mssql_database_max_size_gb                           = number
    mssql_database_read_scale                            = bool
    mssql_database_sku_name                              = string
    mssql_database_zone_redundant                        = bool
    mssql_database_auto_pause_delay_in_minutes           = number
    mssql_database_create_mode                           = string
    mssql_database_creation_source_database_name         = string
    mssql_database_elastic_pool_name                     = string
    mssql_database_geo_backup_enabled                    = bool
    mssql_database_maintenance_configuration_name        = string
    mssql_database_ledger_enabled                        = bool
    mssql_database_min_capacity                          = number
    mssql_database_restore_point_in_time                 = string
    mssql_database_restore_long_term_retention_backup_id = string
    mssql_database_read_replica_count                    = number
    mssql_database_sample_name                           = string
    mssql_database_storage_account_type                  = string
    mssql_database_transparent_data_encryption_enabled   = bool
    mssql_database_import_storage_uri                    = string
    mssql_database_import_storage_key_type               = string
    mssql_database_import_administrator_login            = string
    mssql_database_import_administrator_login_password   = string
    mssql_database_import_authentication_type            = string
    mssql_server_name                                    = string
    mssql_server_resource_group_name                     = string
    storage_account_name                                 = string
    storage_account_rg                                   = string
mssql_restore_dropped_database_id       =string
 mssql_database_recover_database_id=string
 creation_source_database_id=string
  long_term_retention_policy_enabled=bool
 short_term_retention_policy_enabled=bool
 threat_detection_policy_enabled=bool
    threat_detection_policy = object({

      threat_detection_policy_mssql_database_state       = string
      threat_detection_policy_mssql_database_disabled_alerts = list(string)
      threat_detection_policy_mssql_database_email_account_admins = bool
      threat_detection_policy_mssql_database_email_addresses = list(string)
      threat_detection_policy_threat_retention_days      = number
    })
    long_term_retention_policy = object({
    
      long_term_retention_policy_mssql_database_weekly_retention = string
      long_term_retention_policy_mssql_database_monthly_retention = string
      long_term_retention_policy_mssql_database_yearly_retention = string
      long_term_retention_policy_mssql_database_week_of_year = number
    })
    short_term_retention_policy = object({
      short_term_retention_policy_mssql_database_short_retention_days = number
      short_term_retention_policy_backup_interval_in_hours = number
    })
    import = object({
      mssql_database_import_storage_uri                  = string
      mssql_database_import_storage_key_type             = string
      mssql_database_import_administrator_login          = string
      mssql_database_import_administrator_login_password = string
      mssql_database_import_authentication_type          = string
    })
  }))
}
