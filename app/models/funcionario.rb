class Funcionario < ActiveRecord::Base
    acts_as :funcao, as: :papel
    has_one :usuario
    belongs_to :cargo
end
