class AddColumnCidadeToLogradouro < ActiveRecord::Migration
  def change
    add_reference :logradouros, :cidade, index: true
  end
end
