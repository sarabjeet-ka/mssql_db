mssql_database_variables = {
  sarab_database = {
    mssql_database_name                                  = "sarab-database"
    mssql_database_collation                             = "SQL_Latin1_General_CP1_CI_AS"
    mssql_database_license_type                          = "LicenseIncluded"
    mssql_database_max_size_gb                           = 2
    mssql_database_read_scale                            = false
    mssql_database_sku_name                              = "Basic"
    mssql_database_zone_redundant                        = false
    mssql_database_auto_pause_delay_in_minutes           = 60
    mssql_database_create_mode                           = "Default"
    mssql_database_creation_source_database_name         = null
    mssql_database_elastic_pool_name                     = null
    mssql_database_geo_backup_enabled                    = false
    mssql_database_maintenance_configuration_name        = null
    mssql_database_ledger_enabled                        = false
    mssql_database_min_capacity                          = null
    mssql_database_restore_point_in_time                 = null
    mssql_database_restore_long_term_retention_backup_id = null
    mssql_database_read_replica_count                    = 0
    mssql_database_sample_name                           = null
    mssql_database_storage_account_type                  = "Geo"
    mssql_database_transparent_data_encryption_enabled   = true
    mssql_database_import_storage_uri                    = null
    mssql_database_import_storage_key_type               = "StorageAccessKey"
    mssql_database_import_administrator_login            =null
    mssql_database_import_administrator_login_password   = null
    mssql_database_import_authentication_type            = "SQL"
    mssql_server_name                                    = "sarab-mssql-server1"
    mssql_server_resource_group_name                     = "sarab-rg"
    storage_account_name                                 = "sarablstorageaccount2809"
    storage_account_rg                                   = "sarab-rg"
    mssql_restore_dropped_database_id       =null
 mssql_database_recover_database_id=null
 creation_source_database_id=null
 long_term_retention_policy_enabled=false
 short_term_retention_policy_enabled=false
 threat_detection_policy_enabled=false
   threat_detection_policy = { 
    enabled = true 
   threat_detection_policy_mssql_database_state = "Enabled" 
   threat_detection_policy_mssql_database_disabled_alerts = ["Sql_Injection", "Data_Exfiltration"] 
   threat_detection_policy_mssql_database_email_account_admins = true 
   threat_detection_policy_mssql_database_email_addresses = ["admin@dev.example.com"] 
   threat_detection_policy_threat_retention_days = 30 
   } 
   long_term_retention_policy = { 
    enabled = true 
   long_term_retention_policy_mssql_database_weekly_retention = "P1W" 
   long_term_retention_policy_mssql_database_monthly_retention = "P1M" 
   long_term_retention_policy_mssql_database_yearly_retention = "P1Y" 
   long_term_retention_policy_mssql_database_week_of_year = 1 
   }
    short_term_retention_policy = {
   
      short_term_retention_policy_mssql_database_short_retention_days = 7
      short_term_retention_policy_backup_interval_in_hours = 12
    }
    import = null
  }
}