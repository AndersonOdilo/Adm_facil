class PessoaFisica < ActiveRecord::Base
    acts_as :pessoa, as: :estado

    validates_uniqueness_of :cpf, allow_blank: true, message: 'ja existe'
    validates_uniqueness_of :rg, allow_blank: true, message: 'ja existe'

    accepts_nested_attributes_for :pessoa
end
