json.array!(@unidades) do |unidade|
  json.extract! unidade, :id, :descricao, :sigla
  json.url unidade_url(unidade, format: :json)
end
