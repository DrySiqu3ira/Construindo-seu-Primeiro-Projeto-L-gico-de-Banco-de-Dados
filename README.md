# Construindo seu Primeiro Projeto Logico de Banco de Dados


Este projeto tem como objetivo a modelagem lógica de banco de dados para um cenário de e-commerce. Durante o desenvolvimento, foram aplicados refinamentos no modelo apresentado, incluindo a diferenciação entre clientes Pessoa Jurídica (PJ) e Pessoa Física (PF). O projeto segue as diretrizes de criação de um banco de dados relacional eficiente, com a implementação de chaves primárias e estrangeiras, constraints adequadas e a criação de queries SQL para testes.

## Estrutura do Projeto

### Modelagem do Banco de Dados

A modelagem lógica foi baseada no modelo Entidade-Relacionamento (ER), adaptada para o cenário de e-commerce. O esquema abrange as seguintes entidades principais:

- **Cliente**: Identificado como PJ ou PF, com dados específicos para cada tipo de conta. 
- **Produto**: Representa os itens vendidos no e-commerce.
- **Pedido**: Representa as compras realizadas pelos clientes.
- **Pagamento**: Reflete as transações financeiras associadas aos pedidos.

Além disso, foram incorporadas as seguintes refinamentos:
- Diferenciação entre **Pessoa Jurídica (PJ)** e **Pessoa Física (PF)**, garantindo que cada cliente seja atribuído de maneira única a um dos tipos, com a estruturação adequada para cada caso.
- Relacionamentos de **muitos para muitos** entre as entidades (por exemplo, um cliente pode realizar muitos pedidos, e um pedido pode conter múltiplos produtos).
- **Restrições de Integridade** para garantir a consistência dos dados (como `NOT NULL`, `UNIQUE`, `CHECK` e `FOREIGN KEY`).


### Tecnologias Utilizadas

- **Banco de Dados**: MySQL
- **Ferramentas**: SQL Workbench, GitHub


### Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir um pull request com melhorias, sugestões ou correções.
