Rails.application.routes.draw do
  resources :despesas

  resources :vendas

  resources :formas_pagamentos

  resources :orcamentos

  resources :cargos

  devise_for :usuarios

  resources :unidades

  resources :produtos  do
    collection do
      get 'autocomplete'
    end
  end

  resources :categorias_produtos

  resources :marcas

  resources :fornecedores

  resources :funcionarios

  resources :clientes do
    collection do
      get 'autocomplete'
    end
  end

  resources :pessoas_juridicas

  resources :pessoas_fisicas

  resources :enderecos

  match 'estado/cidades/:id', to: "estados#buscar_cidades", via: [:get]

  match 'cidade/bairros/:id', to: "cidades#buscar_bairros", via: [:get]

  match 'bairro/ruas/:id', to: "bairros#buscar_ruas", via: [:get]

  match 'orcamento/add_item', to: "orcamentos#add_item", via: [:post]

  match 'orcamento/remover_item', to: "orcamentos#remover_item", via: [:post]

  match 'orcamento/calcular_desconto', to: "orcamentos#calcular_desconto", via: [:post]

  match 'venda/add_item', to: "vendas#add_item", via: [:post]

  match 'venda/remover_item', to: "vendas#remover_item", via: [:post]

  match 'venda/valor_parcela', to: "vendas#calcular_parcela", via: [:post]

  match 'venda/calcular_desconto', to: "vendas#calcular_desconto", via: [:post]

  match 'pagamentos_vendas/efetuar_pagamento/:id', to: "pagamentos_vendas#efetuar_pagamento", via: [:get]

  match 'despesas_pagamentos/efetuar_pagamento/:id', to: "despesas_pagamentos#efetuar_pagamento", via: [:get]

  match 'venda/finalizar', to: "vendas#finalizar", via: [:post]

  root 'clientes#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
