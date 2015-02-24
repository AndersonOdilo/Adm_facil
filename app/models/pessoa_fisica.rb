class PessoaFisica < ActiveRecord::Base
    acts_as :pessoa, as: :estado
end
