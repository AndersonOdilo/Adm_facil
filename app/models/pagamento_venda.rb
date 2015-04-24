class PagamentoVenda < ActiveRecord::Base
  belongs_to :venda

  def self.vencido(id)
    PagamentoVenda.joins("left join vendas on vendas.id = pagamentos_vendas.venda_id
    left join pedidos on pedidos.actable_id = vendas.id and pedidos.actable_type = 'Venda'
    left join clientes on clientes.id = pedidos.cliente_id
    where clientes.id = #{id} and pagamentos_vendas.data_vencimento <= '#{Date.today}' and
    pagamentos_vendas.data_pagamento is null ")
  end

end
