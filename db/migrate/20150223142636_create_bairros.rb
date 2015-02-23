class CreateBairros < ActiveRecord::Migration
  def change
    create_table :bairros do |t|
      t.string :nome
      t.references :cidade, index: true

      t.timestamps
    end
  end
end
