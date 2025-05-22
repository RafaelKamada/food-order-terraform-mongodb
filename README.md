# :hamburger: Food Order - Terraform MongoDB Infrastructure
![FoodOrder](foodorder.png?raw=true "FoodOrder")

Este módulo implementa a infraestrutura do MongoDB para o projeto Food Order.

## 🏗️ Arquitetura

A infraestrutura é composta por:
- Banco de Dados Gerenciado (MongoDB): Configurado como código para persistência de dados.
- Deploy Automatizado: Utilizando GitHub Actions com proteção de branches.

## 🚀 Tecnologias Utilizadas
- Terraform: Para provisionamento da infraestrutura.
- GitHub Actions: Para CI/CD automatizado.
- MongoDB: Banco de Dados não relacional. 

## 🔧 Configuração e Deploy
### 📌 Pré-requisitos
- Terraform instalado

### 1️⃣ Acesse as configurações do repositório
1. Vá até o repositório no GitHub.
2. Clique em Settings.
3. No menu lateral, clique em Secrets and variables > Actions.
4. Clique em New repository secret.

#### 2️⃣ Adicione as Secrets necessárias
✅ Para autenticação na AWS
Essas credenciais são usadas pelo Terraform e pelo GitHub Actions para acessar a AWS.

    | Nome da secret           | Descrição                                                                |
    | :------------------------| :------------------------------------------------------------------------|
    | `AWS_ACCESS_KEY_ID`      | Chave de acesso da AWS                                                   |
    | `AWS_SECRET_ACCESS_KEY`  | Chave secreta da AWS                                                     |
    | `AWS_SESSION_TOKEN`      | (Opcional) Token de sessão, se estiver usando credenciais temporárias    |

✅ Outras Secrets
Caso sua aplicação use um banco de dados ou outra API, adicione as credenciais necessárias.

    | Nome da secret           | Descrição                  |
    | :------------------------| :--------------------------|
    | `database_name`          | Nome do Banco de Dados     |
    | `database_username`      | Usuário do banco de dados  |
    | `database_password`      | Senha do banco de dados    |

✅ Configuração das variáveis no vars.tf
Você precisará ajustar as variáveis de configuração no arquivo `vars.tf`:

| Nome                | Descrição                 | Tipo   | Default            |
|---------------------|---------------------------|--------|--------------------|
| region              | AWS region                | string | -                  |
| project_name        | Nome do projeto           | string | -                  |
| vpc_id              | ID da VPC                 | string | -                  |
| private_subnet_cidr | CIDR da subnet privada    | string | -                  |
| database_name       | Nome do banco de dados    | string | FoodOrder_Cardapio |
| database_username   | Usuário do banco de dados | string | dev_user           |
| database_password   | Senha do banco de dados   | string | (sensitive)        |

## Outputs

| Nome               | Descrição                 | Valor             |
|--------------------|---------------------------|-------------------|
| mongodb_service_ip | IP do serviço MongoDB     | IP do serviço     |
| mongodb_namespace  | Namespace do MongoDB      | Nome do namespace |
| mongodb_database   | Nome do banco de dados    | Nome do banco     |
| mongodb_username   | Usuário do banco de dados | Usuário           |
| mongodb_password   | Senha do banco de dados   | Senha (sensitive) |
| mongodb_port       | Porta do MongoDB          | 27017             |


## Exemplo de variáveis:

```hcl
module "mongodb" {
  source = "github.com/RafaelKamada/food-order-terraform-mongodb"

  region              = var.region
  project_name        = var.project_name
  vpc_id              = aws_vpc.main_vpc.id
  private_subnet_cidr = cidrsubnet("172.31.0.0/16", 4, 0)
  database_name       = "FoodOrder_Cardapio"
  database_username   = "dev_user"
  database_password   = var.mongodb_password
}
```

Com essas variáveis configuradas, o Terraform poderá utilizar os recursos da AWS de forma segura, garantindo que sua infraestrutura seja criada e configurada corretamente.


### 🗄️ Outros repos do microserviço dessa arquitetura
- [Food Order Produção](https://github.com/diegogl12/food-order-producao)
- [Food Order Pagamento](https://github.com/diegogl12/food-order-pagamento)
- [Food Order Cardápio](https://github.com/RafaelKamada/foodorder-cardapio)
- [Food Order Pedidos](https://github.com/vilacalima/food-order-pedidos)
- [Food Order Usuários](https://github.com/RafaelKamada/FoodOrder)

### 🗄️ Outros repos do Terraform/DB dessa arquitetura
- [Food Order Terraform](https://github.com/RafaelKamada/food-order-terraform-infra)
- [Food Order DB](https://github.com/nathaliaifurita/food-order-terraform-db)
- [Food Order MongoDB](https://github.com/RafaelKamada/food-order-terraform-mongodb)

### :busts_in_silhouette: Autores
| [<img loading="lazy" src="https://avatars.githubusercontent.com/u/96452759?v=4" width=115><br><sub>Robson Vilaça - RM358345</sub>](https://github.com/vilacalima) |  [<img loading="lazy" src="https://avatars.githubusercontent.com/u/16946021?v=4" width=115><br><sub>Diego Gomes - RM358549</sub>](https://github.com/diegogl12) |  [<img loading="lazy" src="https://avatars.githubusercontent.com/u/8690168?v=4" width=115><br><sub>Nathalia Freire - RM359533</sub>](https://github.com/nathaliaifurita) |  [<img loading="lazy" src="https://avatars.githubusercontent.com/u/43392619?v=4" width=115><br><sub>Rafael Kamada - RM359345</sub>](https://github.com/RafaelKamada) |
| :---: | :---: | :---: | :---: |


