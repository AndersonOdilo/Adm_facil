class Orcamento < ActiveRecord::Base
    acts_as :pedido
    accepts_nested_attributes_for :pedido

    def self.total_geral
        total = 0
        Orcamento.all.each do |orcamento|
            total+= orcamento.total
        end
        return total
    end

end

