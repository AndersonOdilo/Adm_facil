class AddColumnCidadeToEnderecos < ActiveRecord::Migration
  def change
    add_reference :enderecos, :cidade, index: true
    add_column :enderecos, :logradouro, :string
    remove_column :enderecos, :logradouro_id
  end
end
