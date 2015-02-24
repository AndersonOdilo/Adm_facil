class AddColumnToEnderecos < ActiveRecord::Migration
  def change
    add_reference :enderecos, :pessoa, index: true
  end
end
