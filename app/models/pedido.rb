class Pedido < ActiveRecord::Base
  actable
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_pedidos, dependent: :destroy
  has_many :produtos, through: :itens_pedidos

  accepts_nested_attributes_for :itens_pedidos
end
