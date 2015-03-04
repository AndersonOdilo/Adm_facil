class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.date :data
      t.decimal :desconto
      t.string :obs
      t.references :cliente, index: true
      t.references :funcionario, index: true

      t.timestamps
    end
  end
end
