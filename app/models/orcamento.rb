class Orcamento < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_orcamentos, dependent: :destroy
  has_many :produtos, through: :itens_orcamentos

  accepts_nested_attributes_for :itens_orcamentos

  scope :do_mes, -> {where(data: Date.current.beginning_of_month..Date.current.end_of_month)}

  def self.total_geral
    self.includes(:itens_orcamentos).collect{|oracamento| oracamento.total }.sum
  end

  def self.total_mes
    self.do_mes.includes(:itens_orcamentos).collect{|oracamento| oracamento.total }.sum
  end

  def total
    self.itens_orcamentos.collect {|item| item.preco_total}.sum
  end

  def total_desconto
    self.total - (self.total * desconto / 100)
  end

end

