class Endereco < ActiveRecord::Base
  belongs_to :logradouro
  belongs_to :pessoa

  def cidade
    self.logradouro.cidade.nome
  end

  def estado
    self.logradouro.cidade.estado.nome
  end

  def pais
    self.logradouro.cidade.estado.pais.nome
  end
end
