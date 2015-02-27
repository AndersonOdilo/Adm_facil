class Fornecedor < ActiveRecord::Base
    acts_as :funcao, as: :papel

    has_many :produtos
end
