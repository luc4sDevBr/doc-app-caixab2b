# Códigos de retorno

| HTTP | Quando | Corpo |
|---|---|---|
| `200` | Deu certo, inclusive atualização sem alteração | Dados da operação + `idRequest` |
| `400` | JSON inválido, campo obrigatório faltando ou formato errado | `{erro, idRequest, mensagem}` |
| `401` | Token ausente, inválido ou expirado, ou acesso suspenso | `{erro, mensagem}` |
| `404` | Cliente não encontrado | `{erro, idRequest, mensagem}` |
| `409` | CPF/CNPJ e produto de outro cliente, ou tabulação repetida em 5 min | `{erro, idRequest, mensagem, ...}` |
| `500` | Erro inesperado | `{erro, idRequest, mensagem}` |

A `mensagem` explica o que corrigir. Em caso de `500`, envie o `idRequest` ao suporte da Focare.
