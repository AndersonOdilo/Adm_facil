class AddColumnDescontoToOrcamento < ActiveRecord::Migration
  def change
    add_column :orcamentos, :desconto, :float
  end
end
