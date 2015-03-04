class Pedido < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_produtos
  has_many :produtos, through: :itens_produtos
end
