class FormaPagamento < ActiveRecord::Base
    validates_uniqueness_of :descricao, :case_sensitive => false
end
