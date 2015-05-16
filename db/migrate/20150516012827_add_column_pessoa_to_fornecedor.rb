class AddColumnPessoaToFornecedor < ActiveRecord::Migration
  def change
    add_reference :fornecedores, :pessoa, index: true
  end
end
