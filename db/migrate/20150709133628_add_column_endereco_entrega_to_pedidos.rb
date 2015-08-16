class AddColumnEnderecoEntregaToPedidos < ActiveRecord::Migration
  def change
    add_reference :pedidos, :endereco, index: true
  end
end
