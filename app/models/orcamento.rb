class Orcamento < ActiveRecord::Base
    acts_as :pedido
    accepts_nested_attributes_for :pedido

    def total
        total = 0
        self.itens_pedidos.each do |item|
            total += item.quantidade * item.preco.to_f
        end
        return total
    end
end

