class PessoaFisica < ActiveRecord::Base
    acts_as :pessoa, as: :estado

    validates_uniqueness_of :cpf
    validates_uniqueness_of :rg

    accepts_nested_attributes_for :pessoa
end
