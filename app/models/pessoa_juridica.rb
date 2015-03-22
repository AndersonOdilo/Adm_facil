class PessoaJuridica < ActiveRecord::Base
    acts_as :pessoa, as: :estado

    validates_uniqueness_of :cnpj
    validates_uniqueness_of :inscricao_estadual

    accepts_nested_attributes_for :pessoa

    def nome
        "#{self.acting_as.nome}, #{self.nome_fantasia}"
    end
end
