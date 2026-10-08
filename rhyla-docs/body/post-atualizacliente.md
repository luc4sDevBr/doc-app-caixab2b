# atualizacliente

**POST** `/api/interface/caixab2b/atualizacliente` · Bearer

Atualiza os dados de um cliente. Envie o `codprospect` e só os campos que quer mudar. Campo vazio ou ausente não é alterado.

## Regras

- Só muda o que vier **preenchido** e **diferente** do valor atual.
- Os formatos são os mesmos do envio de lead ([Campos do cliente](./campos_do_cliente.html)). `id_agencia` que não seja número volta `400`.
- `email` atualiza o e-mail do cliente. E-mail em formato inválido volta `400`.
- Texto maior que o tamanho máximo do campo é cortado no limite.
- Não é possível trocar o CPF/CNPJ e o produto para os de outro cliente: volta `409`.
- Se nada mudou, a resposta é `200` com `camposAtualizados` vazio.

## Requisição

```json
{
  "codprospect": "1523",
  "qtde_func": "75",
  "telefone": "(11) 97777-6666",
  "fornecedor_atual": "Concorrente X",
  "email": "financeiro@empresaexemplo.com.br",
  "nome": "",
  "agencia": ""
}
```

`nome` e `agencia` vão vazios e não são alterados.

## Resposta 200

```json
{
  "idRequest": 1003,
  "sucess": "Cliente atualizado",
  "codprospect": 1523,
  "camposAtualizados": ["qtde_func", "telefone", "fornecedor_atual", "email"],
  "cliente": { "codprospect": 1523, "qtde_func": "75", "telefone": "11977776666", "email": "financeiro@empresaexemplo.com.br" }
}
```

`cliente` traz o cadastro completo, já atualizado.

## Erros

| HTTP | Quando |
|---|---|
| `400` | Sem `codprospect` ou com campo em formato inválido |
| `401` | Token ausente, inválido ou expirado |
| `404` | `codprospect` não existe |
| `409` | O CPF/CNPJ e o produto já pertencem a outro cliente |
