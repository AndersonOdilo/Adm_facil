class AddColumnPessoaToCliente < ActiveRecord::Migration
  def change
    add_reference :clientes, :pessoa, index: true
  end
end
