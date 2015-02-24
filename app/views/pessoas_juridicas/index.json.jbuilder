json.array!(@pessoas_juridicas) do |pessoa_juridica|
  json.extract! pessoa_juridica, :id, :nome_fantasia, :cnpj, :inscricao_estadual
  json.url pessoa_juridica_url(pessoa_juridica, format: :json)
end
