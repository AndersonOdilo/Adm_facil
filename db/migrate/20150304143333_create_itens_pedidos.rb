class CreateItensPedidos < ActiveRecord::Migration
  def change
    create_table :itens_pedidos do |t|
      t.references :produto, index: true
      t.references :pedido, index: true
      t.integer :quantidade
      t.decimal :preco

      t.timestamps
    end
  end
end
