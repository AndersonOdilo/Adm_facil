class Cliente < ActiveRecord::Base
    acts_as :funcao, as: :papel

    has_many :pedidos
    accepts_nested_attributes_for :funcao
end
