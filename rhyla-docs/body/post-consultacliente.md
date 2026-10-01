# consultacliente

**POST** `/api/interface/consultacliente` · Bearer

Consulta clientes por `codprospect`, `cpf` ou `cnpj`. Informe pelo menos um. Se enviar mais de um, o cliente precisa atender a todos.

| Campo | Tipo | Descrição |
|---|---|---|
| `codprospect` | número | Código do cliente |
| `cpf` | texto | CPF ou CNPJ, com ou sem pontuação |
| `cnpj` | texto | Mesma busca do `cpf`. Se os dois vierem, precisam ser iguais. |

## Regras

- O documento pode ir com ou sem pontuação (`.`, `-`, `/`).
- A resposta é uma **lista**, porque o mesmo documento pode ter um cliente por produto. São até 50 clientes, do mais recente para o mais antigo.

## Requisição

```json
{ "cnpj": "12.345.678/0001-90" }
```

## Resposta 200

```json
{
  "idRequest": 1002,
  "sucess": "1 cliente(s) encontrado(s).",
  "total": 1,
  "clientes": [
    {
      "codprospect": 1523,
      "data_cadastro": "2026-09-30 10:15:00",
      "produto": "CARTAO_BENEFICIO",
      "tp_cliente": "PJ",
      "qtde_func": "50",
      "perfil_mailing": "12345678000190",
      "cpf": "12345678000190",
      "nome": "Empresa Exemplo LTDA",
      "nome_fantasia": "Exemplo",
      "dt_abertura": "2010-05-20",
      "id_agencia": "5678",
      "telefone": "11999998888",
      "canal_lead": "form_caixa",
      "fornecedor_atual": "Não utiliza tag atualmente",
      "necessidade_principal": "Centralizar o controle das despesas da frota",
      "interesse_demonstrado": "Demonstrou interesse em avançar com a contratação"
    }
  ]
}
```

Cada cliente traz o `codprospect` e todos os campos de [Campos do cliente](./campos_do_cliente.html).

## Erros

| HTTP | Quando |
|---|---|
| `400` | Nenhum filtro, `codprospect` não numérico, ou `cpf` diferente de `cnpj` |
| `401` | Token ausente, inválido ou expirado |
| `404` | Nenhum cliente encontrado |
