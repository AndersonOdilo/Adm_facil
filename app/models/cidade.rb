class Cidade < ActiveRecord::Base
  belongs_to :estado
  has_many :enderecos, dependent: :restrict_with_error
end
