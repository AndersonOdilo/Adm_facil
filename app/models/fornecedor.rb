class Fornecedor < ActiveRecord::Base
  has_many :produtos, dependent: :restrict_with_error
  belongs_to :pessoa
  accepts_nested_attributes_for :pessoa

  before_save :alter_id

  RailsAdmin.config {|c| c.label_methods << :nome}
  
  def alter_id
    self.pessoa_id = self.pessoa.acting_as.id
  end

  def nome
    "#{self.pessoa.specific.nome}"
  end
end
