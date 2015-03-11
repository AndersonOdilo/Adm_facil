class Endereco < ActiveRecord::Base
  belongs_to :logradouro
  belongs_to :pessoa

  def bairro
    self.logradouro.bairro.nome
  end

  def cidade
    self.logradouro.bairro.cidade.nome
  end

  def estado
    self.logradouro.bairro.cidade.estado.nome
  end

  def pais
    self.logradouro.bairro.cidade.estado.pais.nome
  end
end
