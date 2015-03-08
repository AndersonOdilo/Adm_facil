class ItemPedido < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :produto
  belongs_to :pedido

  def preco_total
    (number_to_currency(self.quantidade * self.preco, unit: 'R$', separator: ",", delimiter: "."))
  end

  def preco_unidade
    (number_to_currency(self.preco, unit: 'R$', separator: ',', delimiter: '.'))
  end
end
