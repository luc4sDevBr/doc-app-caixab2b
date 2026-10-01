# addleadfocare

**POST** `/api/interface/addleadfocare` · Bearer

Envia um novo lead para a operação. Quando o lead é aceito, a empresa recebe o primeiro contato por WhatsApp no `telefone` informado e segue no atendimento comercial.

## Regras

- `cpf`, `nome`, `produto`, `telefone` e `data_cadastro` são obrigatórios. Datas e números precisam seguir o formato de [Campos do cliente](./campos_do_cliente.html).
- Texto maior que o tamanho máximo do campo é cortado no limite. O lead não é recusado por isso.
- Se já existe um cliente com o mesmo CPF/CNPJ e o mesmo produto, o lead é registrado, mas o cliente não é duplicado.
- `canal_lead` identifica a origem do lead (ex.: `form_caixa`) e define a mensagem de boas-vindas.
- `id_agencia` que não seja número é ignorado.

## Requisição

```json
{
  "data_cadastro": "2026-09-30 10:15:00",
  "produto": "CARTAO_BENEFICIO",
  "tp_cliente": "PJ",
  "qtde_func": "50",
  "perfil_mailing": "12345678000190",
  "cpf": "12345678000190",
  "nome": "Empresa Exemplo LTDA",
  "nome_fantasia": "Exemplo",
  "dt_abertura": "2010-05-20",
  "cnae": "João da Silva",
  "desc_cnae": "(11) 97777-6666",
  "sr": "Diretor financeiro",
  "sev": "Frota própria",
  "agencia": "1234",
  "id_agencia": "5678",
  "operacao": "Planilha manual",
  "telefone": "11999998888",
  "canal_lead": "form_caixa",
  "origem_midia": "instagram",
  "fornecedor_atual": "Não utiliza tag atualmente",
  "necessidade_principal": "Centralizar o controle das despesas da frota",
  "interesse_demonstrado": "Demonstrou interesse em avançar com a contratação"
}
```

## Resposta 200

```json
{
  "idRequest": 1001,
  "codmailing": 2385,
  "sucess": "Inserido com sucesso!"
}
```

> **Código do cliente:** o `codprospect` não vem nesta resposta. Para obtê-lo, use [consultacliente](./post-consultacliente.html) com o CPF/CNPJ.

> **Contato real:** cada lead aceito gera uma mensagem de WhatsApp de verdade. Nos testes, use um número da sua equipe.

## Erros

| HTTP | Quando |
|---|---|
| `400` | JSON vazio, sem `cpf` ou com campo em formato inválido |
| `401` | Token ausente, inválido ou expirado |
