json.array!(@fornecedores) do |fornecedor|
  json.extract! fornecedor, :id
  json.url fornecedor_url(fornecedor, format: :json)
end
