class Funcao < ActiveRecord::Base
  actable as: :papel
  belongs_to :pessoa
  accepts_nested_attributes_for :pessoa, limit: 1

  before_save :alter_id
  def alter_id
    self.pessoa_id = self.pessoa.acting_as.id
  end

end
