class GemMoney < ActiveRecord::Migration
  def change
  	remove_column :produtos, :valor_venda
  	remove_column :produtos, :valor_custo

  	add_money :produtos, :valor_venda
  	add_money :produtos, :valor_custo
  end
end
