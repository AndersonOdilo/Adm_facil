class CreateFones < ActiveRecord::Migration
  def change
    create_table :fones do |t|
      t.string :numero

      t.timestamps
    end
  end
end
