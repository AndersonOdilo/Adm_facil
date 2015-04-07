json.array!(@despesas) do |despesa|
  json.extract! despesa, :id, :descricao, :tipo_despesa_id, :forma_pagamento_id
  json.url despesa_url(despesa, format: :json)
end
