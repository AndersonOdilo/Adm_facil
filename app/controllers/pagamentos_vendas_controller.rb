class PagamentosVendasController < ApplicationController

  def efetuar_pagamento
    pagamento = PagamentoVenda.find(params[:id])
    pagamento.data_pagamento = Date.today
    pagamento.save
    render locals: {pagamento: pagamento, data: pagamento.data_pagamento }
  end

end