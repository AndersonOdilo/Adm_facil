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
        total = total - entrada
      end
      data = Date.today
      valor_parcela =  total  / numero_parcelas
      for i in 1..numero_parcelas
        pagamento = DespesaPagamento.new
        pagamento.data_vencimento = data + intervalo_parcela.day
        data = data + intervalo_parcela.day
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
    total = 0
    self.despesas_pagamentos.each do |pagamento|
      total += pagamento.valor
    end
    return total
  end

  def total_pago
    total = 0
    self.despesas_pagamentos.each do |pagamento|
      if pagamento.data_pagamento != nil
        total += pagamento.valor
      end
    end
    return total
  end

end
