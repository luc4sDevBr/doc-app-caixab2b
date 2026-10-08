# addclientedireto

**POST** `/api/interface/caixab2b/addclientedireto` · Bearer

Inclui um cliente que **já está conversando** com a operação por um canal direto: WhatsApp direto, ConnectaCX ou TechIA. Diferente do [addleadfocare](./post-addleadfocare.html), este endpoint **não envia mensagem automática** ao cliente. Ele só registra o cadastro, e o atendimento continua no canal em que a conversa já existe.

## Quando usar

| Situação | Endpoint |
|---|---|
| Lead novo, que ainda não falou com a operação | [addleadfocare](./post-addleadfocare.html) |
| Cliente que já está em conversa por um canal direto | `addclientedireto` |

## Regras

- `origem` é obrigatório e indica o canal da conversa:

| `origem` | Canal |
|---|---|
| `wpp_direct` | WhatsApp direto |
| `cnx_direct` | ConnectaCX |
| `tia_direct` | TechIA |

- `cpf`, `nome`, `produto` e `telefone` são obrigatórios. Datas e números seguem o formato de [Campos do cliente](./campos_do_cliente.html).
- `data_cadastro` é opcional. Sem ela, vale a data e a hora da chamada.
- `canal_lead` não é usado neste endpoint: o canal do cliente é a `origem`.
- `email` é opcional e é gravado no cliente incluído. Se o cliente já existe, o e-mail dele não é alterado: use o [atualizacliente](./post-atualizacliente.html). Um e-mail em formato inválido é ignorado.
- Texto maior que o tamanho máximo do campo é cortado no limite. O cliente não é recusado por isso.
- Se já existe um cliente com o mesmo CPF/CNPJ e o mesmo produto, nada é incluído: a resposta é `200` com `jaExistia: true` e o `codprospect` do cliente. Nesse caso, consulte o cliente em [consultacliente](./post-consultacliente.html) e, se faltar alguma informação, complete com [atualizacliente](./post-atualizacliente.html).

## Requisição

```json
{
  "origem": "wpp_direct",
  "data_cadastro": "2026-10-02 10:15:00",
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
  "origem_midia": "whatsapp",
  "fornecedor_atual": "Não utiliza tag atualmente",
  "necessidade_principal": "Centralizar o controle das despesas da frota",
  "interesse_demonstrado": "Demonstrou interesse em avançar com a contratação",
  "email": "contato@empresaexemplo.com.br"
}
```

## Resposta 200: cliente incluído

```json
{
  "idRequest": 1002,
  "sucess": "Cliente incluído com sucesso!",
  "codprospect": 2390,
  "jaExistia": false,
  "origem": "wpp_direct"
}
```

## Resposta 200: cliente já existe

```json
{
  "idRequest": 1003,
  "sucess": "Cliente já existe (codprospect 2390); nada foi incluído. Consulte o cliente no consultacliente e, se faltar alguma informação, atualize pelo atualizacliente.",
  "codprospect": 2390,
  "jaExistia": true,
  "origem": "wpp_direct"
}
```

> **Código do cliente:** aqui o `codprospect` já vem na resposta, pronto para [atualizacliente](./post-atualizacliente.html) e [tabularlead](./post-tabularlead.html).

## Erros

| HTTP | Quando |
|---|---|
| `400` | JSON vazio, `origem` ausente ou inválida, campo obrigatório faltando ou formato inválido |
| `401` | Token ausente, inválido ou expirado |
| `500` | Erro inesperado: envie o `idRequest` ao suporte da Focare |
