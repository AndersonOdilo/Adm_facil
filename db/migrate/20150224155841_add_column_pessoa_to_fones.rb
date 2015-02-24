class AddColumnPessoaToFones < ActiveRecord::Migration
  def change
    add_reference :fones, :pessoa, index: true
  end
end
