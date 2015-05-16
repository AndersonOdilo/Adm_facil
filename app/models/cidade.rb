class Cidade < ActiveRecord::Base
  belongs_to :estado
  has_many :logradouros, dependent: :restrict_with_error
end
