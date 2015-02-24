class CreateFuncoes < ActiveRecord::Migration
  def change
    create_table :funcoes do |t|
      t.references :pessoa, index: true
      t.actable as: :papel
      t.timestamps
    end
  end
end
