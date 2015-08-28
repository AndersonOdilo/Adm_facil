class RemoveMoney < ActiveRecord::Migration
  def change
  	remove_column :produtos, :valor_venda_currency
  	remove_column :produtos, :valor_custo_currency

  	add_column :produtos, :valor_custo, :decimal, precision: 15, scale: 2
    add_column :produtos, :valor_venda, :decimal, precision: 15, scale: 2

  end
end
