json.array!(@vendas) do |venda|
  json.extract! venda, :id, :forma_pagamento_id
  json.url venda_url(venda, format: :json)
end
