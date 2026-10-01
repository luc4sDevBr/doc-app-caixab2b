# API de Integração Comercial

API da **Focare** para a integração comercial da operação **Caixa B2B**. Com ela, sua empresa envia leads, consulta e atualiza os dados dos clientes e registra tabulações de atendimento.

| Item | Valor |
|---|---|
| **Endereço base** | `{BASE_URL}`, informado pela Focare na liberação do acesso |
| **Formato** | JSON (UTF-8), todas as rotas usam `POST` |
| **Autenticação** | Token Bearer, válido por 8 horas |

> **Guarde o `idRequest`.** Toda resposta traz um `idRequest`. Informe esse número ao suporte da Focare quando precisar de ajuda com uma chamada.

## Endpoints

| Rota | Token | Para quê |
|---|---|---|
| [`/api/interface/autenticacao`](./post-autenticacao.html) | não | Gera o token de acesso |
| [`/api/interface/addleadfocare`](./post-addleadfocare.html) | sim | Envia um novo lead |
| [`/api/interface/consultacliente`](./post-consultacliente.html) | sim | Consulta um cliente por código, CPF ou CNPJ |
| [`/api/interface/atualizacliente`](./post-atualizacliente.html) | sim | Atualiza os dados de um cliente |
| [`/api/interface/tabularlead`](./post-tabularlead.html) | sim | Registra uma tabulação de atendimento |

## Primeiros passos

1. Solicite à Focare o usuário, a senha de integração e o endereço base.
2. Gere o token em [autenticacao](./post-autenticacao.html).
3. Envie `Authorization: Bearer <token>` em todas as outras chamadas.
4. Baixe a [coleção do Postman](./testes_no_postman.html) e teste os endpoints em sequência.
