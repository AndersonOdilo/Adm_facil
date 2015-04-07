class DespesasPagamentosController < ApplicationController

  def efetuar_pagamento
        pagamento = DespesaPagamento.find(params[:id])
        pagamento.data_pagamento = Date.today
        pagamento.save
        respond_to do |format|
            format.js {render locals: {pagamento: pagamento, data: pagamento.data_pagamento }}
        end
    end

end