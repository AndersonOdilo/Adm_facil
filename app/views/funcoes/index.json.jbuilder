json.array!(@funcoes) do |funcao|
  json.extract! funcao, :id, :pessoa_id
  json.url funcao_url(funcao, format: :json)
end
