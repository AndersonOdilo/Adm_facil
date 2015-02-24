class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.actable as: :estado
      t.timestamps
    end
  end
end
