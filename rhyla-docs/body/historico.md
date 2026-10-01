# Histórico

## 01/10/2026

- O bloqueio de tabulação repetida no [`tabularlead`](./post-tabularlead.html) passa de 30 para **5 minutos**.

## 30/09/2026

- Novo endpoint [`tabularlead`](./post-tabularlead.html), com bloqueio de tabulação repetida em 30 minutos.
- Novos campos: `fornecedor_atual`, `necessidade_principal` e `interesse_demonstrado`.
- `id_agencia` passa a ser numérico e `dt_abertura` segue o formato `yyyy-MM-dd`.
- Texto maior que o tamanho máximo passa a ser cortado, em vez de recusar o lead.
- `consultacliente` também encontra o cliente pelo CNPJ enviado em `perfil_mailing`.

## 29/09/2026

- Token Bearer obrigatório no `addleadfocare`.
- Novos endpoints [`consultacliente`](./post-consultacliente.html) e [`atualizacliente`](./post-atualizacliente.html).
