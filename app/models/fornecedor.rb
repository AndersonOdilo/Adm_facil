class Fornecedor < ActiveRecord::Base
    acts_as :funcao, as: :papel
    has_many :produtos

    def nome
        self.pessoa.specific.nome
    end
end
