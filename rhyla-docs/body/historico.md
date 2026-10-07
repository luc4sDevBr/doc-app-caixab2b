# Histórico

## 07/10/2026

- [`addleadfocare`](./post-addleadfocare.html): leads com `produto` de cross-sell (ex.: `CROSS - VTCAIXA`, `TAGCAIXA`) passam a ser identificados como cross-sell no atendimento. Veja [Cliente cross-sell](./post-addleadfocare.html#cliente-cross-sell).
- [`consultacliente`](./post-consultacliente.html) passa a informar se o cliente tem venda (`possui_venda`, `total_vendas`) e o andamento da venda mais recente: tabulações N1, N2 e N3 com as datas e o `status_venda` (`PROMESSA`, `PRÉ-VENDA` ou `CONCLUÍDO`).

## 02/10/2026

- Endereço base da API: **`https://focare-techia.actionline.com.br:30454`**. A coleção do Postman já vem com ele preenchido.
- Novo endpoint [`addclientedireto`](./post-addclientedireto.html): inclui um cliente que já está em conversa por WhatsApp direto, ConnectaCX ou TechIA (`origem`), sem enviar mensagem automática.

## 01/10/2026

- Os endereços passam a ter o prefixo **`/api/interface/caixab2b/`** (ex.: `/api/interface/caixab2b/autenticacao`). Os endereços antigos `/api/interface/...` deixam de responder para a Caixa B2B.
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
