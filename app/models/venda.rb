class Venda < ActiveRecord::Base
  acts_as :pedido
  belongs_to :forma_pagamento
  has_many :pagamentos_vendas

  before_save :baixar_estoque
  accepts_nested_attributes_for :pedido

  def baixar_estoque
    self.itens_pedidos.each do |item|
        if item.produto.quantidade_estoque >= item.quantidade
            produto = item.produto
            produto.quantidade_estoque -= item.quantidade
            produto.save
        else
            item.destroy
        end
    end
  end

  def self.total_geral
    total = 0
    Venda.all.each do |venda|
      total += venda.total
    end
    return total
  end

end
