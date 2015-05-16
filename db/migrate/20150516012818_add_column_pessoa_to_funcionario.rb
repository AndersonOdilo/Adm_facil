class AddColumnPessoaToFuncionario < ActiveRecord::Migration
  def change
    add_reference :funcionarios, :pessoa, index: true
  end
end
