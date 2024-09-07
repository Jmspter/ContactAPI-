# Contact API

A Contact API construída com Rails para receber mensagens de usuários via uma página de "Entre em Contato" e enviar essas mensagens por e-mail.

## Tecnologias Utilizadas

- Ruby on Rails (API mode)
- Action Mailer para envio de e-mails
- SMTP (configurado com Gmail por padrão)
- Gem `mail_form`

## Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/contact_api.git
   cd contact_api
   ```

2. Instale as dependências:
   ```bash
   bundle install
   ```

3. Configure o banco de dados (se houver):
   ```bash
   rails db:create db:migrate
   ```

4. Configure o envio de e-mails. No arquivo `config/environments/development.rb` e `config/environments/production.rb`, adicione suas credenciais SMTP:
   ```ruby
   config.action_mailer.delivery_method = :smtp
   config.action_mailer.smtp_settings = {
     address:              'smtp.gmail.com',
     port:                 587,
     user_name:            ENV['GMAIL_USERNAME'],
     password:             ENV['GMAIL_PASSWORD'],
     authentication:       'plain',
     enable_starttls_auto: true
   }
   ```

5. Crie um arquivo `.env` na raiz do projeto e adicione suas variáveis de ambiente:
   ```bash
   GMAIL_USERNAME=your-email@gmail.com
   GMAIL_PASSWORD=your-email-password
   ```

6. Inicie o servidor:
   ```bash
   rails s
   ```

## Endpoints da API

### POST `/api/v1/contacts`

Envia uma mensagem de contato por e-mail.

#### Request
Envie uma requisição `POST` para o seguinte endpoint:
```
http://localhost:3000/api/v1/contacts
```

#### Parâmetros:

- `name`: (string) Nome do usuário que está enviando a mensagem.
- `subject`: (string) Assunto da mensagem.
- `message`: (string) Corpo da mensagem.

#### Exemplo de Request:
```bash
curl -X POST http://localhost:3000/api/v1/contacts \
-H "Content-Type: application/json" \
-d '{
  "name": "John Doe",
  "subject": "Support Request",
  "message": "I need help with my account."
}'
```

#### Exemplo de Response:
```json
{
  "status": "Message sent"
}
```

## Integração com Next.js

Você pode consumir esta API diretamente a partir da sua aplicação Next.js. Exemplo de como fazer uma requisição POST com `fetch`:

```js
const sendMessage = async () => {
  const response = await fetch('http://localhost:3000/api/v1/contacts', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      name: 'John Doe',
      subject: 'Support Request',
      message: 'I need help with my account.',
    }),
  });

  const data = await response.json();
  console.log(data); // { status: "Message sent" }
};
```

## Testando

Para testar a API localmente:

1. Inicie o servidor com:
   ```bash
   rails s
   ```

2. Use uma ferramenta como [Postman](https://www.postman.com/) ou [Insomnia](https://insomnia.rest/) para enviar requisições `POST` ao endpoint `/api/v1/contacts`.

## Deploy

Configure suas variáveis de ambiente no servidor de produção para o envio de e-mails corretamente. Certifique-se de ter um SMTP configurado e todas as credenciais de e-mail em ambiente seguro.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests para melhorias.

## Licença

Este projeto está licenciado sob a licença MIT.
```

Este arquivo dá instruções claras sobre como instalar, configurar, testar e usar a API, além de incluir exemplos de como integrá-la em uma aplicação Next.js.