json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :limite_credito
  json.url cliente_url(cliente, format: :json)
end
