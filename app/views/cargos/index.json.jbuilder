json.array!(@cargos) do |cargo|
  json.extract! cargo, :id, :descricao
  json.url cargo_url(cargo, format: :json)
end
