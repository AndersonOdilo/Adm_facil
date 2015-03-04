Rails.application.routes.draw do
  resources :pedidos

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

  resources :clientes

  resources :pessoas_juridicas

  resources :pessoas_fisicas

  resources :enderecos

  match 'estado/cidades/:id', to: "estados#buscar_cidades", via: [:get]

  match 'cidade/bairros/:id', to: "cidades#buscar_bairros", via: [:get]

  # root 'welcome#index'

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
