class Endereco < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :cidade

  def estado
    self.cidade.estado.sigla
  end

  def pais
    self.cidade.estado.pais.sigla
  end
end
