class AlterPrecisionToProdutos < ActiveRecord::Migration
  def change
    change_column :produtos, :valor_venda, :decimal, :precision => 15, :scale => 2, null: false
    change_column :produtos, :valor_custo, :decimal, :precision => 15, :scale => 2, null: false
  end
end
