output "mongodb_service_ip" {
  description = "IP do serviço MongoDB"
  value       = kubernetes_service.mongodb.spec[0].cluster_ip
}
 
output "mongodb_namespace" {
  description = "Namespace do MongoDB"
  value       = kubernetes_namespace.mongodb.metadata[0].name
}

output "mongodb_database" {
  description = "Nome do banco de dados"
  value       = var.database_name
}

output "mongodb_username" {
  description = "Usuário do banco de dados"
  value       = var.database_username
}

output "mongodb_password" {
  description = "Senha do banco de dados"
  value       = var.database_password
  sensitive   = true
}

output "mongodb_port" {
  description = "Porta do MongoDB"
  value       = 27017
}
