json.array!(@estoques) do |estoque|
  json.extract! estoque, :id, :quantidade, :nivel_alerta, :unidade_id
  json.url estoque_url(estoque, format: :json)
end
