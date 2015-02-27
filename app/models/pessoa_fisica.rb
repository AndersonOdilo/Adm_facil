class PessoaFisica < ActiveRecord::Base
    acts_as :pessoa, as: :estado

    accepts_nested_attributes_for :pessoa
end
