json.array!(@categorias_produtos) do |categoria_produto|
  json.extract! categoria_produto, :id, :descricao
  json.url categoria_produto_url(categoria_produto, format: :json)
end
