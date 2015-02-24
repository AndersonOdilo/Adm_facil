class Bairro < ActiveRecord::Base
  belongs_to :cidade
  has_many :logradouros, dependent: :restrict_with_error
end
