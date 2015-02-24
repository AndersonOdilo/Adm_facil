json.array!(@produtos) do |produto|
  json.extract! produto, :id, :cod, :nome, :descricao, :valor_custo, :valor_venda, :marca_id, :categoria_produto_id, :fornecedor_id
  json.url produto_url(produto, format: :json)
end
