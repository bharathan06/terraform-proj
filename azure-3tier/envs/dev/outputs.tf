output "db_fqdn" {
  description = "PostgreSQL server FQDN"
  value       = module.database.fqdn
}

output "db_admin_user" {
  description = "DB admin username"
  value       = module.database.administrator_login
}
