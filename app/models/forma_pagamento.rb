class FormaPagamento < ActiveRecord::Base
	has_many :pedidos, dependent: :restrict_with_error
  validates_uniqueness_of :descricao, :case_sensitive => false
end
