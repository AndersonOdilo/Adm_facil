class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :nome
      t.string :sigla

      t.timestamps
    end
  end
end
