class Funcao < ActiveRecord::Base
  actable as: :papel
  belongs_to :pessoa

  accepts_nested_attributes_for :pessoa
end
