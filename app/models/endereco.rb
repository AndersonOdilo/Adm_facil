class Endereco < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :cidade

  RailsAdmin.config {|c| c.label_methods << :logradouro}

  def estado
    self.cidade.estado.sigla
  end

  def pais
    self.cidade.estado.pais.sigla
  end
end
