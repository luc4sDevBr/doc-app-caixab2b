# API de Integração Comercial

API da **Focare** para a integração comercial da operação **Caixa B2B**. Com ela, sua empresa envia leads, inclui clientes que já estão em conversa, consulta e atualiza os dados dos clientes e registra tabulações de atendimento.

| Item | Valor |
|---|---|
| **Endereço base** | `https://focare-techia.actionline.com.br:30454` |
| **Formato** | JSON (UTF-8), todas as rotas usam `POST` |
| **Autenticação** | Token Bearer, válido por 8 horas |

> **Guarde o `idRequest`.** Toda resposta traz um `idRequest`. Informe esse número ao suporte da Focare quando precisar de ajuda com uma chamada.

## Endpoints

| Rota | Token | Para quê |
|---|---|---|
| [`/api/interface/caixab2b/autenticacao`](./post-autenticacao.html) | não | Gera o token de acesso |
| [`/api/interface/caixab2b/addleadfocare`](./post-addleadfocare.html) | sim | Envia um novo lead |
| [`/api/interface/caixab2b/addclientedireto`](./post-addclientedireto.html) | sim | Inclui um cliente que já está em conversa por um canal direto, sem mensagem automática |
| [`/api/interface/caixab2b/consultacliente`](./post-consultacliente.html) | sim | Consulta um cliente por código, CPF ou CNPJ |
| [`/api/interface/caixab2b/atualizacliente`](./post-atualizacliente.html) | sim | Atualiza os dados de um cliente |
| [`/api/interface/caixab2b/tabularlead`](./post-tabularlead.html) | sim | Registra uma tabulação de atendimento |

## Primeiros passos

1. Solicite à Focare o usuário, a senha de integração e o endereço base.
2. Gere o token em [autenticacao](./post-autenticacao.html).
3. Envie `Authorization: Bearer <token>` em todas as outras chamadas.
4. Baixe a [coleção do Postman](./testes_no_postman.html) e teste os endpoints em sequência.
