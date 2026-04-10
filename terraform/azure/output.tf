output "vm_connection_info" {
  description = "Connection details for the single VM"
  value = {
    ip_address  = azurerm_public_ip.pip.ip_address
    ssh_command = "ssh -i ${replace(var.ssh_public_key_path, ".pub", "")} ${var.admin_user}@${azurerm_public_ip.pip.ip_address}"
  }
}

#database

output "db_host" {
  value = azurerm_mysql_flexible_server.database.fqdn
}

output "mysql_server_fqdn" {
  description = "The fully qualified domain name of the MySQL server"
  value       = azurerm_mysql_flexible_server.database.fqdn
}

output "mysql_database_name" {
  description = "The name of the logical database created"
  value       = azurerm_mysql_flexible_database.epicbook_db.name
}

output "mysql_admin_user" {
  description = "The administrator username for the database"
  value       = var.db_admin_user
}

output "mysql_connection_string" {
  description = "Example connection string for the application"
  value       = "mysql://${var.db_admin_user}:${var.db_admin_password}@${azurerm_mysql_flexible_server.database.fqdn}/${var.db_name}"
  sensitive   = true
}
