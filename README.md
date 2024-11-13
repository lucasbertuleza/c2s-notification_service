# Notification Service
<sup>Repositório parte do teste técnico da C2S.</sup>

Este serviço é composto por um back-end (API + banco de dados) e um Message Broker. O back-end, representado na cor vermelha, é uma API que implementa um endpoint responsável por receber notificações armazená-las em um banco de dados MySQL. As notificações são enviadas pela [webapp](https://github.com/lucasbertuleza/c2s-main_app) e o serviço de [web scraping](https://github.com/lucasbertuleza/c2s-webscraping_service) contendo detalhes das tarefas, enquanto o broker gerencia o envio de mensagens a cerca do status atual de cada tarefa. Cada tópico (representado na cor laranja) está associado a uma fila que corresponde a um possível status.

![c4_container](https://github.com/user-attachments/assets/de1c731c-49d9-4a8a-b7d8-83533e09d18f)

## Dependências

- Docker
- Docker Compose

**Observação 1:** Talvez você encontre alguma dificuldade para fazer o build da aplicação caso esteja executando o Linux no Windows com o WSL. \
**Observação 2:** Se você utiliza o compose como plugin, utilize `docker-compose` ao invés de `docker compose` ao executar os comandos.

## Build

Caso você tenha o utilitário `make` instalado, basta executar o seguinte comando na raiz do projeto:

```sh
make build
```

Caso contrário:

```sh
cp .env.example .env
docker compose build
```

## Executando a aplicação

⚠️ **Atenção!** \
Esta aplicação faz parte de um conjunto de 4 serviços e é uma das dependências do [gerenciador de tarefas](https://github.com/lucasbertuleza/c2s-main_app) e do serviço de [web scraping](https://github.com/lucasbertuleza/c2s-webscraping_service). Dessa forma, é necessário que ela esteja em execução para que tais serviços possam funcionar adequadamente.

```bash
make up
# ou
docker compose up -d
```

Verifique o status (**Up**) de todos os containers para garantir que não houve qualquer problema:

```bash
docker compose ps -a --format "table {{.Name}}\t{{.Status}}"
```

O painel administrativo do RabbitMQ estará disponível na porta 8080, basta acessar a URL http://localhost:8080 e utilizar a palavra "guest" (sem aspas) como crendeciais para _username_ e _password_.
