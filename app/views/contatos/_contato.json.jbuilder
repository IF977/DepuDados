json.extract! contato, :id, :nome, :email, :telefone, :mensagem, :created_at, :updated_at
json.url contato_url(contato, format: :json)
