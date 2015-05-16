class Orcamento < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_orcamentos, dependent: :destroy
  has_many :produtos, through: :itens_orcamentos

  accepts_nested_attributes_for :itens_orcamentos

    def self.total_geral
        total = 0
        Orcamento.all.each do |orcamento|
            total+= orcamento.total
        end
        return total
    end

  def total
    total = 0
    self.itens_orcamentos.each do |item|
      total += item.quantidade * item.preco.to_f
    end
    return total
  end

  def total_desconto
    total_desconto = self.total - (self.total * desconto / 100)
  end

end

