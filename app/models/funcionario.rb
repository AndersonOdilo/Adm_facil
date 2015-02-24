class Funcionario < ActiveRecord::Base
    acts_as :funcao, as: :papel
end
