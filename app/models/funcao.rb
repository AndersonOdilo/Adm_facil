class Funcao < ActiveRecord::Base
  actable as: :papel
  belongs_to :pessoa
end
