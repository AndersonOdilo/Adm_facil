class Orcamento < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_orcamentos, dependent: :destroy
  has_many :produtos, through: :itens_orcamentos

  accepts_nested_attributes_for :itens_orcamentos

  def self.total_geral
      Orcamento.all.collect {|orcamento| orcamento.total}.sum
  end

  def total
    self.itens_orcamentos.collect {|item| item.preco_total}.sum
  end

  def total_desconto
    total_desconto = self.total - (self.total * desconto / 100)
  end

end

