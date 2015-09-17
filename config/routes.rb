Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :despesas

  resources :pedidos

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

  resources :enderecos

  get 'financeiro' => 'administrativo#index'

  match 'financeiro/relatorio', to: "administrativo#relatorio", via: [:post, :get]

  get 'pais/estados/:id' => 'paises#buscar_estados'

  get 'estado/cidades/:id' => 'estados#buscar_cidades'

  match 'orcamento/add_item', to: "orcamentos#add_item", via: [:post]

  match 'orcamento/remover_item', to: "orcamentos#remover_item", via: [:post]

  match 'orcamento/calcular_desconto', to: "orcamentos#calcular_desconto", via: [:post]

  match 'pedido/add_item', to: "pedidos#add_item", via: [:post]

  match 'pedido/remover_item', to: "pedidos#remover_item", via: [:post]

  match 'pedido/valor_parcela', to: "pedidos#calcular_parcela", via: [:post]

  match 'pedido/calcular_desconto', to: "pedidos#calcular_desconto", via: [:post]

  match 'pagamentos_vendas/efetuar_pagamento/:id', to: "pagamentos_vendas#efetuar_pagamento", via: [:get]

  match 'despesas_pagamentos/efetuar_pagamento/:id', to: "despesas_pagamentos#efetuar_pagamento", via: [:get]

  match 'pedido/finalizar', to: "pedidos#finalizar", via: [:post]

  match 'pontos/registrar', to: "pontos#save", via: [:post]

  get 'pontos' => 'pontos#index'

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
