class RemoveAndAddColumnsToLogradouros < ActiveRecord::Migration
  def change
     remove_column :logradouros, :cidade_id
     add_reference :logradouros, :bairro, index: true
  end
end
