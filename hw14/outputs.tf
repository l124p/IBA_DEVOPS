# output "db_instance_address" {
#   description = "The address of the RDS instance"
#   value       = module.db_instance.db_instance_address
# }

# output "db_instance_arn" {
#   description = "The ARN of the RDS instance"
#   value       = module.db_instance.db_instance_arn
# }

# output "db_instance_endpoint" {
#   description = "The connection endpoint"
#   value       = module.db_instance.db_instance_endpoint
# }

# output "db_instance_engine" {
#   description = "The database engine"
#   value       = module.db_instance.db_instance_engine
# }

# output "db_instance_id" {
#   description = "The RDS instance ID"
#   value       = module.db_instance.db_instance_id
# }

# output "db_instance_status" {
#   description = "The RDS instance status"
#   value       = module.db_instance.db_instance_status
# }

# output "db_instance_name" {
#   description = "The database name"
#   value       = module.db_instance.db_instance_name
# }

# output "db_instance_username" {
#   description = "The master username for the database"
#   value       = module.db_instance.db_instance_username
#   sensitive   = true
# }

# output "db_instance_password" {
#   description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
#   value       = local.password
#   sensitive   = true
# }

# output "db_instance_port" {
#   description = "The database port"
#   value       = module.db_instance.db_instance_port
# }
