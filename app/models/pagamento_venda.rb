class PagamentoVenda < ActiveRecord::Base
  belongs_to :pedido

  scope :em_aberto, -> (id) {joins("left join pedidos on pedidos.id = pedido_id
      left join clientes on clientes.id = cliente_id
      where clientes.id = #{id} and pagamentos_vendas.data_pagamento is null")}

  scope :vencido, -> (id) {joins("left join pedidos on pedidos.id = pedido_id
    left join clientes on clientes.id = cliente_id
    where clientes.id = #{id} and pagamentos_vendas.data_vencimento <= '#{Date.today}' and
    pagamentos_vendas.data_pagamento is null")}

  scope :do_mes, -> {where('data_vencimento >= ? and data_pagamento isnull',Date.today.beginning_of_month)}
  scope :vencido_geral, -> {where('data_pagamento isnull')}

  def self.total_receber_mes
    self.do_mes.sum(:valor)
  end

  def self.total_vencido
    self.vencido_geral.sum(:valor)
  end

end
