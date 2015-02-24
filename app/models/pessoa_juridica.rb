class PessoaJuridica < ActiveRecord::Base
    acts_as :pessoa, as: :estado
end
