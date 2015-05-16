class ItemOrcamento < ActiveRecord::Base
  belongs_to :orcamento
  belongs_to :produto

  def preco_total
    self.quantidade * self.preco
  end
end
