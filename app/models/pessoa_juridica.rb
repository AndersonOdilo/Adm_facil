class PessoaJuridica < ActiveRecord::Base
    acts_as :pessoa, as: :estado
    has_many :enderecos, through: :pessoa
    has_many :fones, through: :pessoa
    has_many :emails, through: :pessoa

    validates_uniqueness_of :cnpj, allow_blank: true, message: 'ja existe'
    validates_uniqueness_of :inscricao_estadual, allow_blank: true, message: 'ja existe'

    def nome
        "#{self.acting_as.nome}, #{self.nome_fantasia}"
    end
end
