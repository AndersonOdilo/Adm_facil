class Fornecedor < ActiveRecord::Base
  acts_as :funcao, as: :papel
  has_many :produtos, dependent: :restrict_with_error
  accepts_nested_attributes_for :funcao

  def nome
    "#{self.pessoa.specific.nome}"
  end
end
