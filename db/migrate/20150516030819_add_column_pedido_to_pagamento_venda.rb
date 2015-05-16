class AddColumnPedidoToPagamentoVenda < ActiveRecord::Migration
  def change
    add_reference :pagamentos_vendas, :pedido, index: true
  end
end
