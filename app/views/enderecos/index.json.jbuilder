json.array!(@enderecos) do |endereco|
  json.extract! endereco, :id, :numero, :complemento, :rua_id
  json.url endereco_url(endereco, format: :json)
end
