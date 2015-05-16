class AddColumnFuncionarioToOrcamento < ActiveRecord::Migration
  def change
    add_reference :orcamentos, :funcionario, index: true
    add_reference :orcamentos, :cliente, index: true
  end
end
