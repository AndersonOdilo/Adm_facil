class PessoaFisica < ActiveRecord::Base
    acts_as :pessoa, as: :estado

    validates_uniqueness_of :cpf, :case_sensitive => false
    validates_uniqueness_of :rg, :case_sensitive => false

    accepts_nested_attributes_for :pessoa
end
