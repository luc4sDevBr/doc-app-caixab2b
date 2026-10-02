# Como autenticar

Gere o token em [`/api/interface/caixab2b/autenticacao`](./post-autenticacao.html) com o usuário e a senha de integração fornecidos pela Focare. Depois, envie-o em todas as outras chamadas:

```http
Authorization: Bearer <token>
Content-Type: application/json
```

- O token vale **8 horas**. Depois disso, as chamadas voltam `401` e é preciso gerar um novo.
- Se o acesso do usuário for suspenso, o token deixa de funcionar na hora.
- A resposta `401` explica o motivo:

```json
{ "erro": true, "mensagem": "Token inválido ou expirado. Gere um novo em api/interface/caixab2b/autenticacao." }
```

| Mensagem | O que fazer |
|---|---|
| Token não informado… | Envie o header `Authorization: Bearer <token>` |
| Token inválido ou expirado… | Gere um novo token |
| Usuário da API desabilitado. | Fale com a Focare |

> Guarde o usuário, a senha e o token com segurança e não os envie por e-mail ou chat.
