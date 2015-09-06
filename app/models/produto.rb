class Produto < ActiveRecord::Base
  has_many :itens_orcamentos, dependent: :restrict_with_exception
  has_many :itens_pedidos, dependent: :restrict_with_exception
  belongs_to :marca
  belongs_to :categoria_produto
  belongs_to :fornecedor
  belongs_to :unidade

  validates_uniqueness_of :cod, allow_blank: true, message: 'já existe'

  scope :fornecedor, ->(id) {where(fornecedor_id: id)}
  scope :em_falta, -> {where(quantidade_estoque: 0)}
  scope :disponivel, -> {where('quantidade_estoque > 0')}
end
