class RemoveAddClomnsToEnderecos < ActiveRecord::Migration
  def change
    remove_reference :enderecos, :rua, index: true
    add_reference :enderecos, :logradouro, index: true
  end
end
