class CreateLogradouros < ActiveRecord::Migration
  def change
    create_table :logradouros do |t|
      t.string :nome
      t.string :cep
      t.references :cidade, index: true

      t.timestamps
    end
  end
end
