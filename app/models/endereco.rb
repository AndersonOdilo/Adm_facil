class Endereco < ActiveRecord::Base
  belongs_to :rua
  belongs_to :pessoa
end
