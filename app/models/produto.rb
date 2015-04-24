class Produto < ActiveRecord::Base
  belongs_to :marca
  belongs_to :categoria_produto
  belongs_to :fornecedor
  belongs_to :unidade

  validates_uniqueness_of :cod, allow_blank: true
end
