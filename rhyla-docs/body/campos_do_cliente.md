# Campos do cliente

Os mesmos nomes valem no envio do lead, na atualização e na resposta da consulta.

| Campo JSON | O que enviar | Formato / tamanho máximo | Obrigatório no lead |
|---|---|---|---|
| `data_cadastro` | Data de cadastro do lead | `yyyy-MM-dd HH:mm:ss` | sim |
| `produto` | Produto de interesse | texto, 200 | sim |
| `tp_cliente` | Tipo de cliente | `PF` ou `PJ` | |
| `qtde_func` | Quantidade de veículos / tags | número inteiro | |
| `perfil_mailing` | CNPJ | texto, 50 | |
| `cpf` | CPF ou CNPJ | texto, 50 | sim |
| `nome` | Nome da empresa | texto, 200 | sim |
| `nome_fantasia` | Nome fantasia | texto, 500 | |
| `dt_abertura` | Data de abertura da empresa | `yyyy-MM-dd` | |
| `cnae` | Nome do representante / decisor | texto, 500 | |
| `desc_cnae` | Telefone do representante | texto, 50 | |
| `sr` | Cargo do representante | texto, 50 | |
| `sev` | Tipo de utilização | texto, 50 | |
| `agencia` | Agência | texto, 10 | |
| `id_agencia` | ID da agência | número inteiro | |
| `operacao` | Processo / controle atual | texto, 200 | |
| `telefone` | Telefone da empresa, usado no contato por WhatsApp | DDD + número (10 ou 11 dígitos) | sim |
| `canal_lead` | Canal de origem do lead (ex.: `form_caixa`) | texto, 10 | |
| `origem_midia` | Mídia de origem (ex.: `instagram`) | texto, 50 | |
| `fornecedor_atual` | Fornecedor atual | texto, 200 | |
| `necessidade_principal` | Necessidade principal | texto, 500 | |
| `interesse_demonstrado` | Interesse demonstrado | texto, 500 | |

## Observações

- Texto maior que o tamanho máximo é cortado no limite.
- O telefone pode ir com ou sem máscara; na resposta ele volta só com dígitos.
- Na consulta, cada cliente também traz o `codprospect` (código do cliente).
