class RemoveColumnBairroIdToLogradouros < ActiveRecord::Migration
  def change
     remove_column :pagamentos_vendas, :venda_id
     remove_column :pedidos, :actable_id
     remove_column :pedidos, :actable_type
  end
end
