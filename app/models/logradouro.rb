class Logradouro < ActiveRecord::Base
  belongs_to :bairro
  has_many :enderecos, dependent: :restrict_with_error
end
