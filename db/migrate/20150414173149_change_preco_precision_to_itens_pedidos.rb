class ChangePrecoPrecisionToItensPedidos < ActiveRecord::Migration
  def change
    change_column :itens_pedidos, :preco, :decimal, precision: 15, scale: 2
  end
end
