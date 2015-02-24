class Cliente < ActiveRecord::Base
    acts_as :funcao, as: :papel
end
