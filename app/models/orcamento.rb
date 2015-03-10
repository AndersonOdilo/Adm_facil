class Orcamento < ActiveRecord::Base
    acts_as :pedido
    accepts_nested_attributes_for :pedido

end

