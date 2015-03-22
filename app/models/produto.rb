class Produto < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :marca
  belongs_to :categoria_produto
  belongs_to :fornecedor
  belongs_to :unidade

  validates_uniqueness_of :cod, :case_sensitive => false

  def preco_custo
    number_to_currency(self.valor_custo, unit: 'R$', separator: ",", delimiter: ".")
  end

  def preco_venda
    number_to_currency(self.valor_venda, unit: 'R$', separator: ",", delimiter: ".")
  end

end
