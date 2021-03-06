class Produto < ActiveRecord::Base
  has_many :itens_orcamentos, dependent: :restrict_with_exception
  has_many :orcamentos, through: :itens_pedidos
  has_many :itens_pedidos, dependent: :restrict_with_exception
  has_many :pedidos, through: :itens_pedidos
  has_many :notificacaos
  belongs_to :marca
  belongs_to :categoria_produto
  belongs_to :fornecedor
  belongs_to :unidade

  validates_uniqueness_of :cod, allow_blank: true, message: 'já existe'

  RailsAdmin.config {|c| c.label_methods << :nome}

  scope :fornecedor, ->(id) {where(fornecedor_id: id)}
  scope :em_falta, -> {where(quantidade_estoque: 0)}
  scope :disponivel, -> {where('quantidade_estoque > 0')}

  def quantidade_vendida
    self.itens_pedidos.sum(:quantidade)
  end
end
