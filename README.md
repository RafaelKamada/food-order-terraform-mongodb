# Terraform MongoDB Infrastructure

Este módulo implementa a infraestrutura do MongoDB para o projeto Food Order.

## Requisitos

- Terraform >= 1.0.0
- AWS CLI configurado
- AWS Provider configurado
- Kubernetes Provider configurado

## Variáveis de Entrada

| Nome | Descrição | Tipo | Default |
|------|-----------|------|---------|
| region | AWS region | string | - |
| project_name | Nome do projeto | string | - |
| vpc_id | ID da VPC | string | - |
| private_subnet_cidr | CIDR da subnet privada | string | - |
| database_name | Nome do banco de dados | string | FoodOrder_Cardapio |
| database_username | Usuário do banco de dados | string | dev_user |
| database_password | Senha do banco de dados | string | (sensitive) |

## Outputs

| Nome | Descrição | Valor |
|------|-----------|-------|
| mongodb_service_ip | IP do serviço MongoDB | IP do serviço |
| mongodb_namespace | Namespace do MongoDB | Nome do namespace |
| mongodb_database | Nome do banco de dados | Nome do banco |
| mongodb_username | Usuário do banco de dados | Usuário |
| mongodb_password | Senha do banco de dados | Senha (sensitive) |
| mongodb_port | Porta do MongoDB | 27017 |

## Exemplo de Uso

```hcl
module "mongodb" {
  source = "github.com/RafaelKamada/food-order-terraform-mongodb"

  region            = var.region
  project_name      = var.project_name
  vpc_id           = aws_vpc.main_vpc.id
  private_subnet_cidr = cidrsubnet("172.31.0.0/16", 4, 0)
  database_name     = "FoodOrder_Cardapio"
  database_username = "dev_user"
  database_password = var.mongodb_password
}
```
