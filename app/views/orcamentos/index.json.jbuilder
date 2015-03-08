json.array!(@orcamentos) do |orcamento|
  json.extract! orcamento, :id
  json.url orcamento_url(orcamento, format: :json)
end
