class PessoaJuridica < ActiveRecord::Base
    acts_as :pessoa, as: :estado

    validates_uniqueness_of :cnpj, :case_sensitive => false
    validates_uniqueness_of :inscricao_estadual, :case_sensitive => false

    accepts_nested_attributes_for :pessoa

    def nome
        "#{self.acting_as.nome}, #{self.nome_fantasia}"
    end
end
