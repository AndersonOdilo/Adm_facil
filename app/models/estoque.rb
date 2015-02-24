class Estoque < ActiveRecord::Base
  belongs_to :unidade
  has_one :produto
end
