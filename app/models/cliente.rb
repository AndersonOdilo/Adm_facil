class Cliente < ActiveRecord::Base
  has_many :pedidos
  has_many :orcamentos
  belongs_to :pessoa
  accepts_nested_attributes_for :pessoa

  def limite_disponivel
  	total = PagamentoVenda.em_aberto(self.id).collect{|pagamento| pagamento.valor}.sum
  	self.limite_credito - total
  end
end
