class PagamentoVenda < ActiveRecord::Base
  belongs_to :pedido

  def self.vencido(id)
    PagamentoVenda.joins("left join pedidos on pedidos.id = pedido_id
    left join clientes on clientes.id = cliente_id
    where clientes.id = #{id} and pagamentos_vendas.data_vencimento <= '#{Date.today}' and
    pagamentos_vendas.data_pagamento is null")
  end

  def self.em_aberto(id)
		PagamentoVenda.joins("left join pedidos on pedidos.id = pedido_id
    left join clientes on clientes.id = cliente_id
    where clientes.id = #{id} and pagamentos_vendas.data_pagamento is null")
  end
end
