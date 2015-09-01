class Cliente < ActiveRecord::Base
  has_many :pedidos
  has_many :orcamentos
  belongs_to :pessoa
  accepts_nested_attributes_for :pessoa
  before_destroy :pagamentos_em_aberto

  before_save :alter_id
  
  def alter_id
    self.pessoa_id = self.pessoa.acting_as.id
  end

  def limite_disponivel
  	total = PagamentoVenda.em_aberto(self.id).collect{|pagamento| pagamento.valor}.sum
  	self.limite_credito - total
  end

  def pagamentos_em_aberto
  	if !PagamentoVenda.em_aberto(self.id).blank?
  		errors.add(:base, "Esse cliente possui contas pendentes.")
 			return false
 		else
 			return true
  	end
  end
  
end
