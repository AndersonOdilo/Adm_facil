class Pedido < ActiveRecord::Base
  actable
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_pedidos, dependent: :destroy
  has_many :produtos, through: :itens_pedidos

  accepts_nested_attributes_for :itens_pedidos

  def total
    total = 0
    self.itens_pedidos.each do |item|
      total += item.quantidade * item.preco.to_f
    end
    return total
  end

  def total_desconto
    total = self.total
    total_desconto = total - (total * desconto / 100)
  end
end
