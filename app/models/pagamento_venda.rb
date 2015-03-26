class PagamentoVenda < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :venda

  scope :vencidos, -> {where("data_vencimento <= ? and data_pagamento is null ",Date.today)}

  def preco
     (number_to_currency(self.valor, unit: 'R$', separator: ",", delimiter: "."))
  end
end
