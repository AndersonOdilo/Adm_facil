class Cliente < ActiveRecord::Base
  has_many :pedidos
  belongs_to :pessoa

  accepts_nested_attributes_for :pessoa
end
