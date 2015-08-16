class Despesa < ActiveRecord::Base
  belongs_to :tipo_despesa
  belongs_to :forma_pagamento
  has_many :despesas_pagamentos, dependent: :destroy

  def gerar_duplicatas(entrada, numero_parcelas, intervalo_parcela, total)
    if self.forma_pagamento.id != 1
      if entrada > 0
        pagamento = DespesaPagamento.new
        pagamento.data_vencimento = Date.today
        pagamento.data_pagamento = Date.today
        pagamento.valor = entrada
        self.despesas_pagamentos << pagamento
        total -= entrada
      end
      data = Date.today
      valor_parcela =  total  / numero_parcelas
      for i in 1..numero_parcelas
        pagamento = DespesaPagamento.new
        data += intervalo_parcela.day
        pagamento.data_vencimento = data 
        pagamento.valor = valor_parcela
        self.despesas_pagamentos << pagamento
      end
    else
      pagamento = DespesaPagamento.new
      pagamento.data_vencimento = Date.today
      pagamento.data_pagamento = Date.today
      pagamento.valor = total
      self.despesas_pagamentos << pagamento
    end
  end

  def total
    self.despesas_pagamentos.collect {|pagamento| pagamento.valor}.sum
  end

  def total_pago
    self.despesas_pagamentos.reject{|pagamento| !pagamento.data_pagamento.nil}.collect{|pagamento| pagamento.valor}.sum
  end

end
