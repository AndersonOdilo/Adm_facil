json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :data, :desconto, :obs, :cliente_id, :funcionario_id
  json.url pedido_url(pedido, format: :json)
end
