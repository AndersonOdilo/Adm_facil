class AddColumnToProdutos < ActiveRecord::Migration
  def change
    add_reference :produtos, :unidade, index: true
    add_column :produtos, :quantidade_estoque, :integer
  end
end
