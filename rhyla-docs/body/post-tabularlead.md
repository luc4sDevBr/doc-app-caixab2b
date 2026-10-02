# tabularlead

**POST** `/api/interface/caixab2b/tabularlead` · Bearer

Registra o resultado de um atendimento feito pela sua equipe ou pelo seu sistema (por exemplo "sem interesse" ou "retornar depois"). Os códigos de tabulação válidos são informados pela Focare.

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `codprospect` | número | sim | Código do cliente. Também é aceito como `codcliente`. |
| `codtabulacao` | número | sim | Código da tabulação |
| `atendente` | texto | não | Nome de quem atendeu. Acento e maiúsculas não importam. |
| `desctabulacao` | texto | não | Descrição da tabulação. A resposta traz sempre a descrição oficial. |
| `datainicio` | `yyyy-MM-dd HH:mm:ss` | não | Início do atendimento. Se vazio, vale o horário do envio. |

## Regras

- **Tabulação repetida:** a mesma tabulação para o mesmo cliente dentro de **5 minutos** não é registrada de novo. A resposta é `409` e informa o registro que já existe.
- O andamento comercial do cliente é atualizado de acordo com a tabulação. O resultado vem no objeto `venda` da resposta.
- Tabulações de venda enviadas pela API não criam nem alteram uma venda.

## Requisição

```json
{
  "codprospect": "1523",
  "atendente": "Maria Souza",
  "codtabulacao": "15",
  "datainicio": "2026-09-30 10:05:00"
}
```

## Resposta 200

```json
{
  "idRequest": 1004,
  "sucess": "Chamada tabulada com sucesso",
  "idChamada": 5530,
  "codprospect": 1523,
  "codtabulacao": 15,
  "desctabulacao": "SEM INTERESSE",
  "codusuario": 32,
  "atendenteEncontrado": true,
  "venda": {
    "codvenda": 0,
    "alterada": false,
    "caixinha": 0,
    "motivo": "Cliente sem venda na esteira"
  }
}
```

| Campo | Significado |
|---|---|
| `idChamada` | Código do registro do atendimento |
| `atendenteEncontrado` | `false` quando o nome do atendente não foi reconhecido. O registro é feito mesmo assim. |
| `venda.alterada` | `true` quando o andamento comercial do cliente mudou |
| `venda.caixinha` | Etapa atual: 1 = Promessa · 2 = Pré-venda · 3 = Concluído (0 = sem alteração) |
| `venda.motivo` | Explicação do resultado |

## Resposta 409 (tabulação repetida)

```json
{
  "erro": true,
  "idRequest": 1005,
  "mensagem": "O cliente já tem a tabulação 15 (SEM INTERESSE) em 2026-09-30 10:05:12 (chamada 5530). Não foi gravada de novo (trava de 5 min).",
  "idChamadaExistente": 5530,
  "dataChamadaExistente": "2026-09-30 10:05:12"
}
```

## Erros

| HTTP | Quando |
|---|---|
| `400` | Sem `codprospect` ou `codtabulacao`, `datainicio` inválida, ou código de tabulação que não existe |
| `401` | Token ausente, inválido ou expirado |
| `404` | Cliente não encontrado |
| `409` | Mesma tabulação para o cliente nos últimos 5 minutos |
