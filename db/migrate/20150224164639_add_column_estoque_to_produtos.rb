class AddColumnEstoqueToProdutos < ActiveRecord::Migration
  def change
    add_reference :produtos, :estoque, index: true
  end
end
