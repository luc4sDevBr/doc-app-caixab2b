# autenticacao

**POST** `/api/interface/caixab2b/autenticacao` · sem token

Gera o token de acesso.

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `login` | texto | sim | Usuário de integração |
| `senha` | texto | sim | Senha de integração |

## Requisição

```json
{
  "login": "usuario_integracao",
  "senha": "********"
}
```

## Resposta 200

O corpo é o próprio token, como texto JSON:

```json
"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

## Erros

| HTTP | Quando |
|---|---|
| `400` | Usuário ou senha incorretos, ou campos vazios |
