# Campos do cliente (de-para)

Os mesmos nomes valem no envio do lead ([addleadfocare](./post-addleadfocare.html)), na inclusão de cliente em conversa ([addclientedireto](./post-addclientedireto.html)), na atualização ([atualizacliente](./post-atualizacliente.html)) e na resposta da consulta ([consultacliente](./post-consultacliente.html)).

> **Atenção ao significado:** alguns campos mantêm o nome técnico original, mas guardam outra informação na operação Caixa B2B. Eles estão marcados com ★ na tabela e resumidos logo abaixo.

## De-para

| Campo JSON | O que enviar | Formato / tamanho máximo | Obrigatório no lead | Exemplo |
|---|---|---|---|---|
| `data_cadastro` | Data de cadastro do lead | `yyyy-MM-dd HH:mm:ss` | sim | `2026-09-30 10:15:00` |
| `produto` | Produto de interesse | texto, 200 | sim | `CARTAO_BENEFICIO` |
| `tp_cliente` | Tipo de cliente | `PF` ou `PJ` | | `PJ` |
| `qtde_func` ★ | Quantidade de veículos / tags | número inteiro | | `50` |
| `perfil_mailing` ★ | CNPJ | texto, 50 | | `12345678000190` |
| `cpf` | CPF ou CNPJ | texto, 50 | sim | `12345678000190` |
| `nome` | Nome da empresa | texto, 200 | sim | `Empresa Exemplo LTDA` |
| `nome_fantasia` | Nome fantasia | texto, 500 | | `Exemplo` |
| `dt_abertura` | Data de abertura da empresa | `yyyy-MM-dd` | | `2010-05-20` |
| `cnae` ★ | Nome do representante / decisor | texto, 500 | | `João da Silva` |
| `desc_cnae` ★ | Telefone do representante | texto, 50 | | `(11) 97777-6666` |
| `sr` ★ | Cargo do representante | texto, 50 | | `Diretor financeiro` |
| `sev` ★ | Tipo de utilização | texto, 50 | | `Frota própria` |
| `agencia` | Agência | texto, 10 | | `1234` |
| `id_agencia` | ID da agência | número inteiro | | `5678` |
| `operacao` ★ | Processo / controle atual | texto, 200 | | `Planilha manual` |
| `telefone` | Telefone da empresa, usado no contato por WhatsApp | DDD + número (10 ou 11 dígitos) | sim | `11999998888` |
| `canal_lead` | Canal de origem do lead (no `addclientedireto`, vem da `origem`) | texto, 10 | | `form_caixa` |
| `origem_midia` | Mídia de origem | texto, 50 | | `instagram` |
| `fornecedor_atual` | Fornecedor atual | texto, 200 | | `Não utiliza tag atualmente` |
| `necessidade_principal` | Necessidade principal | texto, 500 | | `Centralizar o controle das despesas da frota` |
| `interesse_demonstrado` | Interesse demonstrado | texto, 500 | | `Demonstrou interesse em avançar` |
| `email` | E-mail do cliente | e-mail (`nome@dominio.com.br`) | | `contato@empresa.com.br` |

## Campos com outro significado (★)

| Nome do campo | Na operação Caixa B2B é |
|---|---|
| `qtde_func` | Quantidade de veículos / tags (não é quantidade de funcionários) |
| `perfil_mailing` | CNPJ da empresa |
| `cnae` | Nome do representante / decisor (não é o código CNAE) |
| `desc_cnae` | Telefone do representante (não é a descrição do CNAE) |
| `sr` | Cargo do representante |
| `sev` | Tipo de utilização |
| `operacao` | Processo / controle atual da empresa |

## Observações

- **Tamanho:** texto maior que o tamanho máximo é cortado no limite, sem recusar o lead. Atenção a `desc_cnae`, `sr` e `sev`, que aceitam só 50 caracteres.
- **Números:** `qtde_func` e `id_agencia` precisam ser números inteiros. No envio do lead, um `id_agencia` inválido é ignorado; na atualização, ele volta erro `400`.
- **Datas:** `data_cadastro` no formato `yyyy-MM-dd HH:mm:ss` e `dt_abertura` no formato `yyyy-MM-dd`.
- **Telefones:** `telefone` (da empresa) pode ir com ou sem máscara e é o número que recebe o contato por WhatsApp; na resposta ele volta só com dígitos. `desc_cnae` (do representante) é guardado exatamente como foi enviado.
- **E-mail:** `email` é guardado sem espaços nas pontas e em minúsculas. No envio de lead e no `addclientedireto`, um e-mail inválido é ignorado e o cliente é gravado normalmente; na atualização, ele volta erro `400`.
- **Grafia:** `necessidade_principal` também é aceito como `nescessidade_principal`.
- **Consulta por documento:** o `consultacliente` procura o CPF/CNPJ informado tanto em `cpf` quanto em `perfil_mailing`, sem pontuação.
- **Consulta por telefone:** o `consultacliente` também procura pelo `telefone`, considerando o número com e sem `55`, com e sem o nono dígito e com ou sem máscara.
- **Código do cliente:** na consulta, cada cliente também traz o `codprospect`, usado na atualização e na tabulação.
