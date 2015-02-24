class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :cod
      t.string :nome
      t.string :descricao
      t.decimal :valor_custo
      t.decimal :valor_venda
      t.references :marca, index: true
      t.references :categoria_produto, index: true
      t.references :fornecedor, index: true

      t.timestamps
    end
  end
end
