class CreateFornecedores < ActiveRecord::Migration
  def change
    create_table :fornecedores do |t|

      t.timestamps
    end
  end
end
