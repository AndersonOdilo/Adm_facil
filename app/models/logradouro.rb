class Logradouro < ActiveRecord::Base
  belongs_to :cidade
  has_many :enderecos
end
