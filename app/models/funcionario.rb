class Funcionario < ActiveRecord::Base
    acts_as :funcao, as: :papel
    belongs_to :cargo
end
