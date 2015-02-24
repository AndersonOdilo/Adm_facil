json.array!(@pessoas_fisicas) do |pessoa_fisica|
  json.extract! pessoa_fisica, :id, :cpf, :rg, :data_nascimento
  json.url pessoa_fisica_url(pessoa_fisica, format: :json)
end
