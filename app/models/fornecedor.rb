class Fornecedor < ActiveRecord::Base
    acts_as :funcao, as: :papel
    has_many :produtos, dependent: :restrict_with_error

    def nome
        "#{self.pessoa.specific.nome}"
    end
end
