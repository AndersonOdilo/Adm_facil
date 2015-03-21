class Cliente < ActiveRecord::Base
    acts_as :funcao, as: :papel

    accepts_nested_attributes_for :funcao
end
