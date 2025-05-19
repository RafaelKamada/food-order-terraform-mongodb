variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
}

variable "database_name" {
  description = "Nome do banco de dados"
  type        = string
  default     = "FoodOrder_Cardapio"
}

variable "database_username" {
  description = "Usuário do banco de dados"
  type        = string
  default     = "dev_user"
}

variable "database_password" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}
