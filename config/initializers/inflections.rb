ActiveSupport::Inflector.inflections(:en) do |inflect|
    inflect.irregular 'pais', 'paises'
    inflect.irregular 'pessoa_fisica', 'pessoas_fisicas'
    inflect.irregular 'pessoa_juridica', 'pessoas_juridicas'
    inflect.irregular 'funcao', 'funcoes'
    inflect.irregular 'fornecedor', 'fornecedores'
    inflect.irregular 'categoria_produto', 'categorias_produtos'
    inflect.irregular 'item_pedido', 'itens_pedidos'
    inflect.irregular 'forma_pagamento', 'formas_pagamentos'
    inflect.irregular 'pagamento_venda', 'pagamentos_vendas'

#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
