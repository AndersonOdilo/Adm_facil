json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome
  json.url pessoa_url(pessoa, format: :json)
end
