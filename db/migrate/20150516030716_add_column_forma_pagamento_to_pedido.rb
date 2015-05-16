class AddColumnFormaPagamentoToPedido < ActiveRecord::Migration
  def change
    add_reference :pedidos, :forma_pagamento, index: true
  end
end
