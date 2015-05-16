class Fornecedor < ActiveRecord::Base
  has_many :produtos, dependent: :restrict_with_error
  belongs_to :pessoa

  accepts_nested_attributes_for :pessoa

  def nome
    "#{self.pessoa.specific.nome}"
  end
end
