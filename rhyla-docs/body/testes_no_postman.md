# Testes no Postman

A coleção do Postman tem uma chamada pronta para cada endpoint, já com testes automáticos, e pode ser rodada em sequência.

[⬇ Baixar a coleção do Postman (.json)](./public/API_Integracao_Comercial_CaixaB2B.postman_collection.json)

## Como usar

1. No Postman, clique em **Import** e escolha o arquivo baixado.
2. Na aba **Variables** da coleção, preencha:

| Variável | O que colocar |
|---|---|
| `baseUrl` | Endereço base informado pela Focare |
| `login` / `senha` | Usuário e senha de integração |
| `telefoneTeste` | Um número da sua equipe: o envio de lead gera um WhatsApp real |
| `codtabulacao` / `codtabulacao2` | Dois códigos de tabulação diferentes informados pela Focare |
| `atendente` | Nome de um atendente cadastrado |

3. Clique em **Run collection** e rode tudo em ordem. O token, o documento de teste e o `codprospect` são preenchidos automaticamente entre as chamadas.

> Cada execução completa cria um cliente de teste. Combine com a Focare o ambiente de testes antes de rodar.

## Problemas comuns

| Erro | O que fazer |
|---|---|
| `ECONNRESET` ou falha de conexão | Confira se o `baseUrl` começa com `https://` |
| `401` em todas as chamadas | Confira `login` e `senha`: o primeiro teste precisa gerar o token |
| `409` na tabulação | A mesma tabulação já foi enviada para o cliente há menos de 5 minutos |
