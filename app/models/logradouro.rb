class Logradouro < ActiveRecord::Base
  belongs_to :cidade
  has_many :enderecos, dependent: :restrict_with_error
end
