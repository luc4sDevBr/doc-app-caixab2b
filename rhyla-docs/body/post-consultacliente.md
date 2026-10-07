# consultacliente

**POST** `/api/interface/caixab2b/consultacliente` · Bearer

Consulta clientes por `codprospect`, `cpf` ou `cnpj`. Informe pelo menos um. Se enviar mais de um, o cliente precisa atender a todos.

| Campo | Tipo | Descrição |
|---|---|---|
| `codprospect` | número | Código do cliente |
| `cpf` | texto | CPF ou CNPJ, com ou sem pontuação |
| `cnpj` | texto | Mesma busca do `cpf`. Se os dois vierem, precisam ser iguais. |

## Regras

- O documento pode ir com ou sem pontuação (`.`, `-`, `/`).
- A resposta é uma **lista**, porque o mesmo documento pode ter um cliente por produto. São até 50 clientes, do mais recente para o mais antigo.
- Cada cliente traz também se ele **tem venda** e, se tiver, o andamento da venda mais recente (veja [Venda do cliente](#venda-do-cliente)).

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
      "interesse_demonstrado": "Demonstrou interesse em avançar com a contratação",
      "possui_venda": true,
      "total_vendas": 1,
      "venda": {
        "codvenda": 8,
        "data_venda": "2026-09-30 14:57:00",
        "status_venda": "CONCLUÍDO",
        "tabulacao_n1": "PROMESSA",
        "data_tabulacao_n1": "2026-09-30 14:57:00",
        "tabulacao_n2": "PRÉ VENDA",
        "data_tabulacao_n2": "2026-09-30 14:59:17",
        "tabulacao_n3": "VENDA - TAGCAIXA",
        "data_tabulacao_n3": "2026-09-30 15:00:42"
      }
    }
  ]
}
```

Cada cliente traz o `codprospect`, todos os campos de [Campos do cliente](./campos_do_cliente.html) e os campos da venda abaixo.

## Venda do cliente

| Campo | Tipo | Descrição |
|---|---|---|
| `possui_venda` | booleano | `true` se o cliente tem pelo menos uma venda |
| `total_vendas` | número | Quantidade de vendas do cliente |
| `venda` | objeto ou `null` | A venda **mais recente**. `null` quando `possui_venda` é `false` |
| `venda.codvenda` | número | Código da venda |
| `venda.data_venda` | texto | Data e hora da venda (`yyyy-MM-dd HH:mm:ss`) |
| `venda.status_venda` | texto | Andamento da venda: `PROMESSA`, `PRÉ-VENDA` ou `CONCLUÍDO` |
| `venda.tabulacao_n1` / `venda.data_tabulacao_n1` | texto | Tabulação e data da 1ª etapa (promessa) |
| `venda.tabulacao_n2` / `venda.data_tabulacao_n2` | texto | Tabulação e data da 2ª etapa (pré-venda). `null` se ainda não chegou |
| `venda.tabulacao_n3` / `venda.data_tabulacao_n3` | texto | Tabulação e data da 3ª etapa (conclusão). `null` se ainda não chegou |

O `status_venda` é a última etapa preenchida: só N1 = `PROMESSA`, até N2 = `PRÉ-VENDA`, até N3 = `CONCLUÍDO`.

Cliente sem venda:

```json
"possui_venda": false,
"total_vendas": 0,
"venda": null
```

## Erros

| HTTP | Quando |
|---|---|
| `400` | Nenhum filtro, `codprospect` não numérico, ou `cpf` diferente de `cnpj` |
| `401` | Token ausente, inválido ou expirado |
| `404` | Nenhum cliente encontrado |
