class ItemPedido < ActiveRecord::Base
  belongs_to :produto
  belongs_to :pedido

  def preco_total
    self.quantidade * self.preco
  end
end
