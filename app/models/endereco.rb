class Endereco < ActiveRecord::Base
  belongs_to :logradouro
  belongs_to :pessoa
end
