json.array!(@formas_pagamentos) do |forma_pagamento|
  json.extract! forma_pagamento, :id, :descricao
  json.url forma_pagamento_url(forma_pagamento, format: :json)
end
