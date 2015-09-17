class AddColumnCepToEnderecos < ActiveRecord::Migration
  def change
    add_column :enderecos, :cep, :string
  end
end
