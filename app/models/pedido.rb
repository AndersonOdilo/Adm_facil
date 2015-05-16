class Pedido < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :funcionario
  belongs_to :forma_pagamento
  has_many :itens_pedidos, dependent: :destroy
  has_many :produtos, through: :itens_pedidos
  has_many :pagamentos_vendas

  accepts_nested_attributes_for :itens_pedidos

  before_save :baixar_estoque

  scope :cliente, ->(id) {where(cliente_id: id)}
  scope :funcionario, ->(id) {where(funcionario_id: id)}

  def baixar_estoque
    self.itens_pedidos.each do |item|
        if item.produto.quantidade_estoque >= item.quantidade
            produto = item.produto
            produto.quantidade_estoque -= item.quantidade
            produto.save
        else
            item.destroy
        end
    end
  end

  def gerar_duplicatas(entrada, numero_parcelas, intervalo_parcela)
    if self.desconto?
      total = self.total_desconto
    else
      total = self.total
    end
    if self.forma_pagamento.id == 5
      if entrada > 0
        pagamento = PagamentoVenda.new
        pagamento.data_vencimento = Date.today
        pagamento.data_pagamento = Date.today
        pagamento.valor = entrada
        self.pagamentos_vendas << pagamento
        total = total - entrada
      end
      data = Date.today
      valor_parcela =  total  / numero_parcelas
      for i in 1..numero_parcelas
        pagamento = PagamentoVenda.new
        pagamento.numero_parcela = i
        pagamento.data_vencimento = data + intervalo_parcela.day
        data = data + intervalo_parcela.day
        pagamento.valor = valor_parcela
        self.pagamentos_vendas << pagamento
      end
    else
      pagamento = PagamentoVenda.new
      pagamento.data_vencimento = Date.today
      pagamento.data_pagamento = Date.today
      pagamento.valor = total
      self.pagamentos_vendas << pagamento
    end
  end

  def self.total_geral
    total = 0
    Pedido.all.each do |venda|
      total += venda.total
    end
    return total
  end

  def total
    total = 0
    self.itens_pedidos.each do |item|
      total += item.quantidade * item.preco.to_f
    end
    return total
  end

  def total_desconto
    total_desconto = self.total - (self.total * desconto / 100)
  end

end
